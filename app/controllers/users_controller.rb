class UsersController < ApplicationController
  def index
    @users = policy_scope(User).order(created_at: :desc)

  end

  def show
    @user = User.find(params[:user_id])
    authorize @user
  end

  def index_dogs
    @dogs = current_user.dogs
    authorize @dogs
  end

end
