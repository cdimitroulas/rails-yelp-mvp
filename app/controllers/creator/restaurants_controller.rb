class Creator::RestaurantsController < CreatorController

  before_action :set_restaurant

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = @user.restaurants.find_by_id(params[:id])
    unless @restaurant
      flash[:notice] = 'You do not have permission to access this page'
      redirect_to root_path
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
