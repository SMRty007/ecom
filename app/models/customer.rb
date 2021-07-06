class Customer < User
    has_many :orders
    has_many :carts
    has_many :products, through: :carts
end