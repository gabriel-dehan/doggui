class DogsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show, :create, :edit, :destroy, :index2]
  
  def index
   @dogs = Dog.all
  end

  def index2

     if params[:query].present?
        @dogs = Dog.where("breed ILIKE ?", "%#{params[:query]}%")
      else
        @dogs = Dog.all
    end

    @dogsmarkers = Dog.where.not(latitude: nil, longitude: nil)
    @markers = @dogsmarkers.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
      }
    end
end
  def show
    @dog = Dog.find(params[:id])
    if @dog.latitude
      @marker = [{
        lat: @dog.latitude,
        lng: @dog.longitude,
      }
      ]
    end
  end

   

  def new
   @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    #authorize @dog

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    #authorize @dog

    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :new
    end

  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private
    def dog_params
      params.require(:dog).permit(:picture, :video, :nickname, :breed, :size, :hair, :color, :lof_number, :description, :birthday_date, :prize, :medical_analyse, :father_lof, :mother_lof, :price)
    end
end


