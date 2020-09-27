class ItemsController < ApplicationController

  def top
  	@genres = Genre.all.where(is_active: true)
  	@items = Item.where(is_active: true).page(params[:page]).per(4)
  end

  def about
  end

  def index
  	@genres = Genre.all.where(is_active: true)
  	@items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  	@cart = @item.cart_items.build
  end

  private

  def item_params
  	params.require(:product).permit(:name, :price, :image_id, :genre_id)
  end

end

