class OrderItemsController < ApplicationController
  def index
  end

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(status: params[:status])
  end
end
