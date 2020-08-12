class Item < ApplicationRecord

	#他のモデルとの関係性
	has_many :cart_items
	belongs_to :genre
	has_many :order_items
end
