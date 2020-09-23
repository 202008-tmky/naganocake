class Admins::CustomersController < ApplicationController
  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
        flash[:success] = "会員情報を更新しました"
  	   redirect_to admins_customer_path(@customer)
    else
       render "edit"
    end
  end

  def index
  	@customers = Customer.all.page(params[:page]).per(10)
  end

  def show
  	@customer = Customer.find(params[:id])
  end


  private

  def customer_params
	params.require(:customer).permit(:email, :first_name, :first_name_kana, :last_name, :last_name_kana, :telephone_number, :postal_code, :address, :is_deleted)
  end
end