class Genre < ApplicationRecord
	has_many :items
	validates :is_active, inclusion: { in: [true, false] }
	validates :name, presence: true
end
