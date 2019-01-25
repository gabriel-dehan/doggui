class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    authorize @user
  end

  def index_dogs
    @dogs = current_user.dogs
    @other_dogs = Dog
                  .where.not(user: current_user)
                  .joins(conversations: :messages)
                  .where(conversation_messages: { user_id: current_user.id })
                  .includes(:user)
                  .uniq
    @liked_dogs = (current_user.get_up_voted(Dog)).includes(:user)
    authorize @dogs
  end

end
