class Order < ApplicationRecord

  belongs_to :customer
  has_many :items
  has_many :carts, through: :customer
  has_many   :order_details, dependent: :destroy

   enum payment_way: { transfer: 0, credit_card: 1 }
end
