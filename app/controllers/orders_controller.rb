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
  def new    
  end

  def create
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
    clear_cart                                                          
    redirect_to carts_index_path
  end
  def update_order_item
    order_item = OrderItem.find(params[:order_item_id])
    order_item.update(status: params[:order_item][:status])
    redirect_to order_list_path
  end
  private
  def clear_cart
    current_user.carts.destroy_all
  end
  def paid_status
    !(params[:order] &&  params[:order][:paid_status])
  end
end
