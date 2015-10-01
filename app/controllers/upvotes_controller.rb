class UpvotesController < ApplicationController
  before_action :pre_vote

  def create
    if @value.vote == 1
      @value.vote = 0
    else
      @value.vote = 1
    end
    respond_to do |format|
      @value.save
      @vote_total = @review.votes.sum(:vote)
      format.json { render json: @vote_total }
    end
  end

  protected

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
