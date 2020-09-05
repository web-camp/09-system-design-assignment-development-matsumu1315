class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def goodbye_customer
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleated: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to customer_path(current_customer.id)
  end

 private
  def customer_params
  	params.require(:customer).permit(:password, :last_name, :first_name, :last_name_phonetic, :first_name_phonetic, :email, :postal_code, :self_address, :phone_number, :is_deleated)
  end

end
