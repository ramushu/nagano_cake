class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "successfully"
      redirect_to admin_root_path
    else
      render :show
    end
  end

end
