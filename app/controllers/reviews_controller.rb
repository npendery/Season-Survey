class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    authenticate_user!
    @review = Review.new(review_params)
    @user = current_user
    @review.user = @user
    @review.item = @item

    if @review.save
      flash[:accepted] = "Review added."
      redirect_to item_path(@item)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def index
    @reviews = review.all
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
