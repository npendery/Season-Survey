class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    authenticate_user!
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @review.item = @item
    @user = current_user
    @review.user = @user
    if @review.save
      flash[:accepted] = "Review added."
      redirect_to item_path(@item)
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
