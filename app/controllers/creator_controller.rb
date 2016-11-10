class CreatorController < ApplicationController
  before_action :set_user

  private

  def set_user
    @user = User.find(session[:current_user_id])
  end
end
