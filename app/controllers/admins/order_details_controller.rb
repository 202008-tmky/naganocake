class Admins::OrderDetailsController < ApplicationController


def update
  	@order_detail = OrderDetail.find(params[:id])
  	# @order_detailに紐づく@orderを取得
  	@order = Order.find(@order_detail.order_id)
  	# @orderに紐づくorder_detailを全て取得
  	@all_order_details = OrderDetail.where(order_id: @order.id)
  	# その中から、製作ステータスが製作完了になっているorder_detailを全て取得
  	@complete_order_details = @all_order_details.where(making_status: "製作完了")
    @order_detail.update(making_status: params[:order_detail][:making_status])
  	if @order_detail.making_status == "製作中"
  		# order_detailのどれかが製作中になれば、@orderの注文ステータスを製作中にする
  	   @order.update(status: "製作中")
  	elsif @all_order_details.count == @complete_order_details.count
  		# @orderに紐づくorder_detailの数と、その中の製作ステータスが製作完了になっている
  		# order_detailの数が一致すれば注文ステータスを発送準備中にする
         @order.update(status: "発送準備中")
    end
  	redirect_back(fallback_location: admins_order_path)
end

private
 def order_detail_params
 	params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :making_status)
 end
end
