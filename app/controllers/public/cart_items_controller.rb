class Public::CartItemsController < ApplicationController
  def index
    # @cart_item = CartItem.find(params[:cart_item_id])
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "successfully"
      redirect_to cart_items_path
    else
      @item = Item.find(cart_item_params[:item_id])
      @genres = Genre.all
      render "public/items/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    # @item = Item.find(cart_item_params[:item_id])
    # @cart_item.customer_id = current_customer.id
    if @cart_item.update(cart_item_params)
      flash[:notice] = "successfully"
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
