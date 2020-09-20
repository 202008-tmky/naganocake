class ItemsController < ApplicationController

  def top
  	@genres = Genre.all
  	@items = Item.all.page(params[:page]).per(4)
  end

  def about
  end

  def index
  	@genres = Genre.all
  	@items = Item.all.page(params[:page]).per(8)
  end

  def show
  end

end
