class ItemsController < ApplicationController
  def index
    if params[:category] == "food"
      @items = Item.where(category_id: 1)
    elsif params[:category] == "clothes"
      @items = Item.where(category_id: 2)
    else
      @items = Item.where(category_id: 3)
    end
  end
end
