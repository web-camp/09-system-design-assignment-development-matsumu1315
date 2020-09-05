class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = OrderItem.where(order_id: @order.id)
  end

  def update
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
  	if @order.update(order_params)
      if @order.status == "入金確認"
        @order_items.each do |order_item|
          order_item.update(productal_status: "製作待ち")
        end
        redirect_to admin_order_path(@order.id)
      else
        render "show"
      end
    end
  end

  private
  def order_params
  	params.require(:order).permit(:customer_id, :postage, :amount_billed, :how_to_pay, :status, :name, :postal_code, :address, :created_at, :updated_at)
  end

end
