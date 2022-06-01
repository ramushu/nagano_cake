class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "successfully"
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
