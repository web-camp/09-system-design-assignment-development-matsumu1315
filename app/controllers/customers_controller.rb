class CustomersController < ApplicationController

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
  	params.require(:customer).permit(:last_name, :first_name, :last_name_phonetic, :first_name_phonetic, :email, :postal_code, :address, :phone_number)
  end

end
