class Genre < ApplicationRecord

	#他のモデルとの関係性
	has_many :items

end
