class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @category = Category.find(params[:category])
    @items = @category.items.order(created_at: :desc).page params[:page]
  end

  def new
    @item = Item.new
  end

  def create
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
    @user = current_user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    authenticate_user!
    @user = current_user
    @item = Item.find(params[:id])

    if @item.update(item_params) && @item.user == @user
      flash[:accepted] = "Item updated."
      redirect_to item_path(@item)
    else
      flash[:errors] = @item.errors.full_messages.join(". ")
      @item = Item.find(params[:id])
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @category = @item.category
    @item.destroy
    flash[:accepted] = "Item deleted."
    redirect_to category_path(@category)
  end

  protected
  def authorize_user
    @item = Item.find(params[:id])
    if !(current_user.admin? || @item.user == current_user)
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def item_params
    list = [:name, :description, :image, :purchase_url, :category_id]
    params.require(:item).permit(list)
  end
end
