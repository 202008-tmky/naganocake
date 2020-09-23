class OrderDetail < ApplicationRecord

	belongs_to :order
	belongs_to :item
	enum making_status: {着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3}

	validates :item_id, :order_id, :amount,
			  :price, presence: true

	validates :price, :amount, numericality: { only_integer: true }

end