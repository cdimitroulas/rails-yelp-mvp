class RestaurantsController < ApplicationController

  before_action :require_login
  before_action :set_restaurant, only: [:show]

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
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id]) if Restaurant.where("id = #{params[:id]}")[0]
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
