class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
      # 同名商品があれば、数量だけ足すロジック
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          add_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, add_amount)
          @cart_item.delete
        end
      end
  	@cart_item.save
  	redirect_to cart_items_path
  end

  def update
    @cart_items = current_customer.cart_items
    @cart_items.find(params[:id]).update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.customer_id = current_customer.id
    @cart_item.destroy
    redirect_to cart_items_path
    end
  end

  def empty
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

 private
  def cart_item_params
  	params.require(:cart_item).permit(:amount, :item_id)
  end

end
