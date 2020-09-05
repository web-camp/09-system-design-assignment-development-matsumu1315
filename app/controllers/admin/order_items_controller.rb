class Admin::OrderItemsController < ApplicationController

  def update
 	@order = Order.find(params[:order_id])
  	@order_item = OrderItem.find(params[:id])
  	@order_item.update(order_item_params)
  	  if @order_item.productal_status == "製作中"
  	  	 @order.update(status: "製作中")
  	  elsif @order_item.productal_status == "製作完了"
  	  	 @order_items = @order.order_items
  	  	 @order_items.each do |order_item|
  	  	 	if order_item.productal_status == "製作完了"
  	  	 	   next
  	  	 	end
  	  	 	redirect_to admin_order_path(@order.id)
  	  	 	return
  	  	 end
  	  	 @order.update(status: "発送待ち")
  	  end
  	redirect_to admin_order_path(@order.id)
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :price, :amount, :productal_status, :created_at, :updated_at)
  end
end
