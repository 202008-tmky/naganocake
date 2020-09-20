class AddressesController < ApplicationController
		#ログインしているユーザー
	  before_action :authenticate_customer!

		#配送先一覧
    def index
        @customer = current_customer
        @shipping_addresses = @customer.addresses
        @shipping_address = Address.new
    end
		#配送先新規保存
    def create
        @shipping_address = Address.new(shipping_address_params)
        @shipping_address.customer_id = current_customer.id
       if @shipping_address.save
           flash[:success] = "登録に成功しました"
           redirect_to addresses_path
        else
            @customer = current_customer
            @shipping_addresses = @customer.shipping_addresses.all
            flash[:warning] = "入力内容を確認してください"
            render :index
        end
    end
        #配送先削除
    def destroy
        @shipping_address = Address.find(params[:id])
        @shipping_address.destroy
        flash[:success] = "削除に成功しました"
        redirect_to addresses_path
    end

    	#配送先編集
    def edit
        @shipping_address = Address.find(params[:id])

        if  current_customer.id != @shipping_address.customer_id
            flash[:warning] = "アクセス権がありません"
            redirect_to addresses_path
        end
    end
    	#編集内容保存
    def update
        @shipping_address = Address.find(params[:id])

        if @shipping_address.update(shipping_address_params)
            redirect_to addresses_path
            flash[:success] =  "更新に成功しました"
        else
            flash[:warning] = "入力内容を確認してください"
            render :edit
        end
    end

    private
    def shipping_address_params
        params.require(:address).permit(:name, :postal_code, :address, :customer_id)
    end

end
