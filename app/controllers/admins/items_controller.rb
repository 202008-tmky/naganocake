class Admins::ItemsController < ApplicationController
  def show
  end

  def index
  end

  def new
  	@items = Item.new
  end

  def create
  	  @items = Item.new(item_params)
      @items.save
      redirect_to admins_item_path(@items)
  end

  def edit
  end

  private

  def item_params
  	params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end
end
