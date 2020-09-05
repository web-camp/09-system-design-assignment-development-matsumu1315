class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
    @genres = Genre.where(available: "true")
  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	redirect_to admin_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.where(available: "true")
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
  	params.require(:item).permit(:product_name, :image, :explanation, :genre_id, :price, :status)
  end

end
