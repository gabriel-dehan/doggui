class DogsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show, :index2]
  def index
   @dogs = policy_scope(Dog).includes(:user, :breed).order("Random()").limit(6)
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
  end

  def new
   @dog = Dog.new
   # This is not needed and this is why there is a "delete" button even when there are no pictures
   # @dog.images.build
   authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog
    upload_images
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
    # This is not needed and this is why there is a "delete" button even when there are no pictures
    # @dog.images.build if @dog.images.blank?
    authorize @dog
  end

  def update
    @dog = Dog.find(params[:id])
    authorize @dog
    delete_images
    upload_images
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      @dog.images.reload
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    authorize @dog
    @dog.destroy
    redirect_to dogs_path
  end

  def index2
    if params[:query].present?
      @dogs = policy_scope(Dog).search_by_breed(params[:query]).page(params[:page]).per(10)
      # @lands_geo = Land.search_by_title_and_address(params[:query]).where.not(latitude: nil, longitude: nil)
      @dogs_geo = Dog.where.not(latitude: nil, longitude: nil)
    else
      @dogs = policy_scope(Dog).page(params[:page]).per(10)
      @dogs_geo = Dog.where.not(latitude: nil, longitude: nil)
    end

   authorize @dogs

   @markers = @dogs_geo.map do |dog|
     {
       lat: dog.latitude,
       lng: dog.longitude,
       nickname: dog.nickname
     }
    end
  end

  def upvote
    @dog = Dog.find(params[:id])
    @dog.upvote_by current_user
    authorize @dog
    render json: { votes: @dog.get_upvotes.size, url: dislike_dog_path(@dog) }
    # redirect_to dogs_path
  end

  def downvote
    @dog = Dog.find(params[:id])
    @dog.downvote_by current_user
    authorize @dog
    render json: { votes: @dog.get_upvotes.size, url: like_dog_path(@dog) }
    # redirect_to dogs_path
  end


  private

  def upload_images
    if params[:dog][:images].present?
      params[:dog][:images].each do |image|
        @dog.images.build(image: image)
      end
    end
  end

  def delete_images
    @dog.images.each do |image|
      image.destroy if params[image.id.to_s] == 'delete'
    end
  end

  def dog_params
    params
      .require(:dog)
      .permit(
        :picture,
        :address,
        :video,
        :nickname,
        :breed_id,
        :size,
        :hair,
        :color,
        :lof_number,
        :description,
        :birthday_date,
        :price,
        :eye_color,
        :version,
        :weight,
        :prize
      )
  end
end
