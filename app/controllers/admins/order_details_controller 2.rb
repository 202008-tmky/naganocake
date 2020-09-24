class Admins::OrderDetailsController < ApplicationController
​
def show
	@order_details = OrderDetail.all
  	@order_detail = OrderDetail.find(params[:id])
end
​
def update
  	@order_detail = OrderDetail.find(params[:id])
  	@order_detail.update(order_detail_params)
  	redirect_back(fallback_location: admins_order_path)
  end
​
private
 def order_detail_params
 	params.require(:order_detail).permit(:making_status)
 end
end