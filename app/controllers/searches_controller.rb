class SearchesController < ApplicationController
  def index
    @search_results = Item.search(params[:search]) ||
      Review.search(params[:search])
  end
end
