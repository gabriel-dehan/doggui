class UsersController < ApplicationController


  def index
    @user = User.all
    authorize @user
  end

  def show
    @user = User.find(params[:user_id])
    authorize @user
  end

end
