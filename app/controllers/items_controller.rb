class ItemsController < ApplicationController

  def top
  	@genres = Genre.all
  	@items = Item.all.page(params[:page]).per(4)
  end

  def index
  end

  def show
  end

end
