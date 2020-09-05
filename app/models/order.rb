class Order < ApplicationRecord

	#他のモデルとの関係性
	belongs_to :customer
	has_many :order_items

	enum how_to_pay: {クレジットカード:0, 銀行振込:1}
	enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送待ち:3, 発送済み:4}

	with_options presence: true do
		validates :postal_code
		validates :address
		validates :name
	end

end
