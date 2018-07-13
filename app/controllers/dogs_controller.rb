class DogsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  def index
  	@dogs = Dog.all
  end

  def show
  	@dog = Dog.find(params[:id])
  end

  def new
   @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to dogs_path
  end

  def edit
  	@dog = Dog.find(params[:id])
  end

  def update
  	@dog = Dog.find(params[:id])
  	@dog.update(dog_params)
    redirect_to dogs_path

  end

  def destroy
  	@dog = Dog.find(params[:id])
  	@dog.destroy
    redirect_to dogs_path
  end
  
  private
    def dog_params
  	  params.require(:dog).permit(:nickname, :description, :picture, :video, :size, :hair, :color, :breed, :birthday_date, :prize, :medical_analyse, :father_lof, :mother_lof, :lof_number, :price)
    end
end

