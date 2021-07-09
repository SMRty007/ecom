class CartsController < ApplicationController
  def index
    @products = current_user.carts.map(&:product)
    @order = Order.all
  end

  def place_order
    p_ids = params[:product_ids].split(' ')
    @order = current_user.orders.new(
      amount: Product.find(p_ids).sum(&:product_amount),
      paid_status: paid_status
      )
      p_ids.each do |p_id|
      @order.order_items << OrderItem.new(product_id: p_id)
    end 
    #o.where(:paid_status => false)
    #o.pending!
    @order.save
    @order.order_items.status = "pending"                                                                            
    clear_cart
    redirect_to carts_index_path
  end
  private
  def clear_cart
    current_user.carts.destroy_all
  end
  def paid_status
    !!(params[:order] &&  params[:order][:paid_status])
  end
end
