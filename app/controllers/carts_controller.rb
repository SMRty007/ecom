class CartsController < ApplicationController
  def index
    @products = current_user.carts.map(&:product)
    @order = Order.all
  end
end