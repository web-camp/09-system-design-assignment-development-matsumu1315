class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #他のモデルとの関係性
        has_many :cart_items
        has_many :orders
        has_many :addresses

  def active_for_authentication?
  	super && (self.is_deleated == false)
  end
end
