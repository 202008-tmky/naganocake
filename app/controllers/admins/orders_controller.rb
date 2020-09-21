class Admins::OrdersController < ApplicationController
  def index
  end

  def show
  	@order = Order.find(params[:id])
  	@orders = Order.all
  	@order_details = OrderDetail.all
  	@order_detail = OrderDetail.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
  	redirect_back(fallback_location: admins_order_path)
  end

private
 def order_params
 	params.require(:order).permit(:status)

 end
end

