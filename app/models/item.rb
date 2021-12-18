class Item < ApplicationRecord

  has_many   :carts
  has_many   :orders
  has_many   :comments, dependent: :destroy
  has_many   :order_details

  validates :is_active, inclusion: { in: [true, false] }
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  attachment :image

end
