class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    raise
  	@review = Review.new
    authorize @review
  end

  def create
  	@review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @dog = @booking.dog
    @review.booking = @booking
    authorize @review
    @review.save!
  	if @review.save
     redirect_to new_dog_booking_review(@review)
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
