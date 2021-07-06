class CartsController < ApplicationController
  def index
    @products = current_user.carts.map(&:product)
  end

  def place_order
    o = current_user.orders.new(amount: Product.find(params[:product_ids]).sum(&:product_amount))
    params[:product_ids].each do |p_id|
      o.order_items << OrderItem.new(product_id: p_id)
    end
    o.pending!
    clear_cart
    redirect_to carts_index_path
  end

  private
  def clear_cart
    current_user.carts.destroy_all
  end
end
