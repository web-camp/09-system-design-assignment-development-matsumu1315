class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.all
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admin_customers_path
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :postal_code, :address, :phone_number, :email, :is_deleated)
  end
end
