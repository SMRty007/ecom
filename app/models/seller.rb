class Seller < User
    has_many :products
    has_many :orders
end