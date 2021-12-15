class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true
  validates :item_id, presence: true
  validates :customer_id, presence: true

  def sum_of_price
    item.price * quantity
  end
end
