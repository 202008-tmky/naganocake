class Admins::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])

  end

  def index
  	@items = Item.all.page(params[:page]).per(10)
  end

  def new
  	@items = Item.new
  end

  def create
  	@items = Item.new(item_params)
    if @items.save
       flash[:success] = "新規商品を登録しました"
       redirect_to admins_item_path(@items)
    else
       render "new"
    end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update(item_params)
       flash[:success] = "商品情報を更新しました"
  	   redirect_to admins_item_path(@item)
    else
       render "edit"
    end
  end

  private

  def item_params
  	params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end

end
