class SellersController < ApplicationController
    def index
        @products = current_user.products
    end
    def order_list
       # @products = current_user.products.joins(:order_items)

        #@statuses = current_user.products.select("distinct(status)").order('status desc')
        #if (params[:status].blank?)
        #    @latestDate = current_user.products.order('date desc').first.date
        #else
        #    @latestDate = params[:status]
        #end
        #@products = current_user.products.joins(:order_items).order('orders.product_id').where('status = :abc', {abc: @latestDate})
    end
end
