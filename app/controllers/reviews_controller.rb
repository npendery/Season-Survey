class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'Review updated.'
      redirect_to item_path(@review.item)
    else
      flash[:notice] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end
  
  protected

  def review_params
    params.require(:review).permit(:rating, :description, :item_id)
  end
end
