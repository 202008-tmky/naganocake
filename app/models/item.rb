class Item < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :customers, through: :cart_items
	has_many :order_details
	has_many :orders, through: :order_details
	attachment :image

	validates :image, :genre_id, :name, :price, presence: true
	validates :introduction, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }

end