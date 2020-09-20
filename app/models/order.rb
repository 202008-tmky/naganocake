class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy
	has_many :items, through: :order_details
	enum payment_method: {銀行振込: 0, クレジットカード: 1, コンビニ決済: 2}

end
