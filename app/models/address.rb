class Address < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :customer

	def all_address
		self.postal_code + self.address + self.name
	end

	with_options presence: true do
		validates :postal_code
		validates :address
		validates :name
	end

end
