class Product < ApplicationRecord
  has_many :product_categories
  has_many :views
  has_many :categories, through: :product_categories
end
