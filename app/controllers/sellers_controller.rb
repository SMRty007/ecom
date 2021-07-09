class SellersController < ApplicationController
    def index
        @products = current_user.products
    end
    def order_list
        #@order_items = current_user.products.map(&:order_items).reject(&:blank?).flatten
        @products = current_user.products.joins(:order_items)
        #@order_items = current_user.products
        # @order_items = order.product  
        # current_user.products.map(&:orders).flatten.reject(&:blank?).map{|o|o.shipped?}
    end
end
