class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

end
