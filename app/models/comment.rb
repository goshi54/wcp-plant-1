class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  #has_many :comments, dependent: :destroy

  validates :comment, presence: true
end
