class UsersController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    authorize @user
  end

  def index_dogs
    @dogs = current_user.dogs.includes(:breed)
    @other_dogs = Dog
                  .where.not(user: current_user)
                  .joins(conversations: :messages)
                  .where(conversation_messages: { user_id: current_user.id })
                  .includes(:user, :breed)
                  .uniq
    @liked_dogs = (current_user.get_up_voted(Dog)).includes(:user, :breed)
    authorize @dogs
  end

end
