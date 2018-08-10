class ReviewsController < ApplicationController


  def new
  	@review = Review.new
    authorize @review
  end

  def create
  	@review = Review.new(review_params)
    authorize @review
    @dog
    @dog
    @review.save
  	if @review.save
     redirect_to dogs_path(@review)
   else
     render :new
   end
  end
  
  def show
    @review = Review.find(params[:id])
    authorize @review
  end 

private
  def review_params
  	 params.require(:review).permit(:content)
  end
end
