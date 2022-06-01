class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = "successfully"
      redirect_to admin_order_path(@order_detail)
    else
      render "admin/orders/show"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
