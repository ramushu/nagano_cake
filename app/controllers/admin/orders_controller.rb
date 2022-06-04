class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # p "あああああああああああああああああああああああああああああ"
    # @order.order_details.each do |order_detail|
    #   p order_detail.making_status
    # end

    @total_price = @order.order_details.sum(:price)
  end

  def update
    @order = Order.find(params[:id])
    # status_change_to_1 = @order.status_was == 0 and @order.status == 1
    if @order.update(order_params)
      flash[:notice] = "successfully"
      # @order.order_details.update_all(making_status: 1)
      # debugger
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end


end
