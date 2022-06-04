class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    # status_change_to_1 = @order_detail.making_status_was == 1 and @order_detail.making_status == 2
    if @order_detail.update(order_detail_params)
      # @order_detail.order.update(status: 1) if status_change_to_1
      flash[:notice] = "successfully"
      # debugger
      redirect_to admin_order_path(@order_detail.order)
    else
      render "admin/orders/show"
    end
    # debugger
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
