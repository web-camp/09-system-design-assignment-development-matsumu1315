class Order < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :customer
	has_many :order_items
end
