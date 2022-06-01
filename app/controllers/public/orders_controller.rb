class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    # elsif params[:order][:select_address] == "2"
    #   if @order
    #     flash[:notice] = "successfully"
    #   else
    #     render :new
    #   end
    # else
    #   render :new
    end
      @cart_items = current_customer.cart_items.all
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
      @postage = 800
      @total_payment = @total + @postage
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        order_detail.save
      end
      redirect_to complete_order_path
      cart_items.destroy_all
    else
      render :new
    end
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total_price = @order.order_details.sum(:price)
    # @total = @order.total_payment - @order.postage
    # order_detail = @order.order_details
    # items = order_detail.items.all
    # @total = items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postage, :total_payment)
  end
end
