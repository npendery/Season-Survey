class ItemsController < ApplicationController
  def index
    # @items = Item.where(category_id: params[:category])
    @category = Category.find(params[:category])
    @items = @category.items
  end

  def new
    @item = Item.new
  end

  def create
    authenticate_user!
    @item = Item.new(item_params)
    @user = current_user
    @item.user = @user

    if @item.save
      flash[:accepted] = "Item added."
      redirect_to item_path(@item)
    else
      flash[:errors] = @item.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

  protected

  def item_params
    list = [:name, :description, :image, :purchase_url, :category_id]
    params.require(:item).permit(list)
  end
end
