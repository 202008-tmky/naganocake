class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).per(10)
  	#  注文個数の合計を表示する書き方(パターン②)の場合に以下記述(/view/orders/index)
  	# @order_details = OrderDetail.page(params[:page]).per(10)
  end

  def show
  end

end
