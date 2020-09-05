class HomeController < ApplicationController

	def top
		@items = Item.all
		@randam_items = @items.sample(5)
	end
end
