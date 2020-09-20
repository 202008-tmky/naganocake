class ItemsController < ApplicationController

  def top
  	@genres = Genre.all
  	@items = Item.all.page(params[:page]).per(4)
  end

  def index
  end

  def show
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  	@cart = @item.cart_items.build
  end


end
