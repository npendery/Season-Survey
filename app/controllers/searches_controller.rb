class SearchesController < ApplicationController
  def index
    @search_results_item = Item.search(params[:search])
    @search_results_review = Review.search(params[:search])
  end
end
