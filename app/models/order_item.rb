class OrderItem < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :order
	belongs_to :item
end
