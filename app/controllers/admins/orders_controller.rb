class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).per(10)
  	#  注文個数の合計を表示する書き方(パターン②)の場合に以下記述(/view/orders/index)
  	# @order_details = OrderDetail.page(params[:page]).per(10)
  end

  def show
     @order = Order.find(params[:id])
     @sum = 0
     @order.order_details.each do |detail|
     @sum = @sum + ((detail.price*1.1).to_i * detail.amount)
    end
     @sum
  end


  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
  	redirect_back(fallback_location: admins_order_path)
  end

private
 def order_params
 	params.require(:order).permit(:created_at, :address, :name, :status, :payment_method, :postal_code, :shipping_cost, :total_payment,
      order_details_attributes: [:order_id, :item_id, :amount, :price, :making_status])
  end
end

