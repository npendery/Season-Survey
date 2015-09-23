class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    authenticate_user!
    item = Item.find(params[:item_id])
    @review = item.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:accepted] = "Review added."
      redirect_to item_path(item)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :description, :item_id)
  end
end
