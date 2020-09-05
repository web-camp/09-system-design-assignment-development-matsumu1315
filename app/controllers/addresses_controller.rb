class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
  	@addresses = current_customer.addresses
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
    @addresses = Address.all
    @address.customer_id = current_customer.id
  	if @address.save
  	   redirect_to addresses_path
    else
       render :index
    end
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    if address.customer_id = current_customer.id
      address.delete
      redirect_to addresses_path
    end
  end

  private
  def address_params
  	params.require(:address).permit(:id, :customer_id, :postal_code, :address, :name)
  end
end
