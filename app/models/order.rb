class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :seller
    has_many :order_items
    has_many :products, through: :order_items
    enum order_status: { pending: 'pending', shipped: 'shipped',refunded: 'refunded',cancel: "cancel",shipped: 'shipped' }
end
