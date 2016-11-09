class Creator::ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_review, only: [:update]

  def edit
  end

  def update
    @review.update(review_params)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_user
    @user = User.find(session[:current_user_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
