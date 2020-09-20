class Address < ApplicationRecord
	belongs_to :customer
	def full_address
		self.address + self.name
	end
end
