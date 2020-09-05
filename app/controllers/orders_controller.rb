class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    if params[:select_address] == "自身の住所"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.self_address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:select_address] == "登録済住所"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:select_address] == "新しい住所"
    end
  end

  def index
    @order = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(@order.id)
  end

  def new
    if current_customer.cart_items.first.present?
      @order = Order.new
      @addresses = Address.all
    else
      @cart_items = current_customer.cart_items
      render 'cart_items/index'
    end
  end

  def create
  	@order = Order.new(order_params)
  	@order.save
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      OrderItem.create!(
        order_id: @order.id,
        item_id: cart_item.item_id,
        price: cart_item.item.price,
        amount: cart_item.amount,
        productal_status: "製作待ち"
        )
    end
    @cart_items.destroy_all
  	redirect_to orders_thanks_path
  end

 private
  def order_params
  	params.require(:order).permit(:customer_id, :postage, :amount_billed, :how_to_pay, :status, :name, :postal_code, :address, :select_address)
  end
end
