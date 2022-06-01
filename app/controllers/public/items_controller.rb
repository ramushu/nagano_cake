class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order(created_at: :desc).all.page(params[:page]).per(8)
      @item = @genre.name
    else
      @items = Item.order(created_at: :desc).all.page(params[:page]).per(8)
      @item = "商品"
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    # @current_stock = 5
    # def stock_array_maker(current_stock)
    #   current_stock < 10 ? [*1..current_stock] : [*1..10]
    # end
    # @current_stock_array = [5]
    # @items.current_stock_array do |amount|
    #   if amount < 10
    #     @current_stock_array += amount + 1
    #   else
    #     break
    #   end
    # end
  end

  # def create
  #   @item = Item.find(params[:id])
  #   if @cart_item.save
  #     flash[:notice] = "successfully"
  #     redirect_to cart_items_path
  #   else
  #     @item = Item.find(params[:item_id])
  #     @genres = Genre.all
  #     render "public/items/show"
  #   end
  # end

  # private

  # def cart_item_params
  #   params.require(:cart_item).permit(:amount)
  # end

end
