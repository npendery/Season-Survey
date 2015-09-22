class ItemsController < ApplicationController
  def index
    @items = Item.where(Category.name == params[:category])
  end
end
