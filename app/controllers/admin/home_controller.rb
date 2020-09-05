class Admin::HomeController < ApplicationController
before_action :authenticate_admin!

	def top
		@order_count = Order.where("date(created_at) = '#{Date.today}'").count
	end

end
