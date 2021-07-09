class OrderItem < ApplicationRecord
    belongs_to :product
    belongs_to :order
    enum status: { pending: 'pending', shipped: 'shipped',cancel: 'cancel' ,delivered: 'delivered',refunded: 'refunded' }
end
