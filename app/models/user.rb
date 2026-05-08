class User < ApplicationRecord
  has_secure_password

  has_many :views
  has_many :viewed_products, through: :views, source: :product
  has_many :orders
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
