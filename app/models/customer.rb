class Customer < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, uniqueness: true, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :postal_code, presence: true, numericality: {only_integer:true}, length: {is: 7}
  validates :address, presence: true
  validates :is_deleted, inclusion: {in:[true,false]}

  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
