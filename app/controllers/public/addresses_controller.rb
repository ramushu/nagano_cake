class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "successfully"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    # @address.customer = current_customer
    if @address.update(address_params)
      flash[:notice] = "successfully"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  # def full_address
  #   "〒" + postal_code + " " + address + " " + name
  # end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
