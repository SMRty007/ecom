class OrdersController < ApplicationController
  def index
    #@order_item = current_user.orders.map(&:order_items)
    #byebug
    @orders = current_user.orders
    
  end
  def show
    order= Order.find(params[:id])
    @products = order.products
  end
end
