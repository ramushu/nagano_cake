class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = "successfully"
      redirect_to admin_root_path
    else
      render "admin/orders/show"
    end
    
  end
end
