class ReviewsController < ApplicationController

  before_action :require_login # THIS NEEDS TO BE IN APPLICATIONCONTROLLER
  before_action :set_restaurant
  before_action :set_user, only: [:create]

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = @user
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_user
    @user = User.find(session[:current_user_id])
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
