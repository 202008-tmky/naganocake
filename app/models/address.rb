class Address < ApplicationRecord
	belongs_to :customer
	def full_address
		self.address + self.name
	end

	validates :customer_id, :name, presence: true
	 validates :address, presence: true

	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end