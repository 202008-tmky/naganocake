class OrdersController < ApplicationController
  def new
        @order = Order.new
     @customer = current_customer
  end

  def create
     if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      # 住所のラジオボタン選択に応じて引数を調整
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postal_code = @customer.postal_code
          @order.address = @customer.address
          @order.name = @customer.first_name + @customer.last_name
        when 2
          @order.postal_code = params[:order][:postal_code]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
        when 3
          @order.postal_code = params[:order][:postal_code]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
      end
      @order.save

       if Address.find_by(address: @order.address).nil?
        @address = Address.new
        @address.postal_code = @order.postal_code
        @address.address = @order.address
        @address.name = @order.name
        @address.customer_id = current_customer.id
        @address.save
      end

      current_customer.cart_items.each do |cart_items|
        order_detail = @order.order_details.build
        order_detail.order_id = @order.id
        order_detail.item_id = cart_items.item_id
        order_detail.amount = cart_items.amount
        order_detail.price = cart_items.item.price
        order_detail.save
        cart_items.destroy #order_detailに情報を移したらcart_itemは消去
      end
      render :thanks
    else
      redirect_to customer_top_path
    end
  end

  def confirm
    @customer = current_customer
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 600
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = @customer.postal_code
        @order.address = @customer.address
        @order.name = @customer.first_name + @customer.last_name
      when 2
        @sta = params[:order][:address_id].to_i
        @address = Address.find(@sta)
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def thanks
  end

  def index
     @customer = current_customer
     @orders = @customer.orders
  end

  def show
  end

   private

  def order_params
    params.require(:order).permit(
      :created_at, :address, :name, :status, :payment_method, :postal_code, :shipping_cost, :total_payment,
      order_details_attributes: [:order_id, :item_id, :amount, :price, :making_status]
      )
  end
end
