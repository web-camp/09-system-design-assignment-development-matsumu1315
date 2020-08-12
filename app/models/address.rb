class Address < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :customer
end
