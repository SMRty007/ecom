class SellersController < ApplicationController
    def index
        @products = current_user.products
    end
    def order_list
        @products = current_user.products.joins(:order_items)
    end
end
