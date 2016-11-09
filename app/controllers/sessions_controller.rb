class SessionsController < ApplicationController

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      redirect_to restaurants_path
    else
      redirect_to root_path
    end
  end

  def new
  end

  def create
    if @user = User.authenticate(params[:email], params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
