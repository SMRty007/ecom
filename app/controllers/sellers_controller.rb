class SellersController < ApplicationController
    def index
        @products = Product.all
    end
end
