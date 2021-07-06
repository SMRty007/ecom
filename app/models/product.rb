class Product < ApplicationRecord
  belongs_to :seller
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :carts
  has_many :customers, through: :carts
end
