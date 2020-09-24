class CustomersController < ApplicationController
  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
    if @customer.update(customer_params)
       flash[:success] = "登録情報を更新しました"
       redirect_to customer_path(@customer)
    else
       render "edit"
    end
  end

  def show
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to customer_top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  def unsubscribe
  end

  private

  def customer_params
  	params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :is_deleted, :address, :postal_code, :address, :telephone_number, :is_deleted, :email )
  end

end
