class CartItem < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :customer
    belongs_to :item
end
