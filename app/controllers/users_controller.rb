class UsersController < ApplicationController

  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user && @user.password == params[:password]
  #     redirect_to restaurants_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to create_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
