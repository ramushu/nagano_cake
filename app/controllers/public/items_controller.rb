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
  end
end
