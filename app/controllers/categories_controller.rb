class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.order(created_at: :desc).page params[:page]
  end
end
