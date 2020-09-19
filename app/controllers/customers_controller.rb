class CustomersController < ApplicationController
  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
    @customer.update(customer_params)
    edirect_to customer_path(@customer)
  end

  def show
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
  	params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :is_deleted, :e-mail, :postal-code, :address, :telephone_number, )
  end

end
