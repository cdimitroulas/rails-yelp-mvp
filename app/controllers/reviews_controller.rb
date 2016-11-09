class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_restaurant

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def require_login
    unless session[:current_user_id]
      redirect_to login_path
    end
  end
end
