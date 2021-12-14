class Order < ApplicationRecord

  belongs_to :customer
  has_many :items
  has_many :carts, through: :customer
end
