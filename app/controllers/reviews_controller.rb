class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show, :new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    item = Item.find(params[:item_id])
    @review = item.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review).deliver_later
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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash[:notice] = "Review deleted."
    redirect_to item_path(@review.item)
  end

  protected
  def authorize_user
    if !user_signed_in? && !(current_user.admin? || @review.user == current_user)
        raise ActionController::RoutingError.new("Not Found")
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description, :item_id)
  end
end
