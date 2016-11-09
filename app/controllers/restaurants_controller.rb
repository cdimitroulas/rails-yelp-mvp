class RestaurantsController < ApplicationController

  before_action :require_login # THIS NEEDS TO BE IN APPLICATIONCONTROLLER
  before_action :set_restaurant, only: [:show]
  before_action :set_user

  def index
    @restaurants = Restaurant.all
  end

  def show
    if @restaurant
      return
    else
      redirect_to root_path
    end
  end

  def new
    @restaurant = @user.restaurants.build
  end

  def create
    @restaurant = @user.restaurants.build(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id]) if Restaurant.where("id = #{params[:id]}")[0]
  end

  def set_user
    @user = User.find(session[:current_user_id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def require_login
    unless session[:current_user_id]
      redirect_to login_path
    end
  end
end
