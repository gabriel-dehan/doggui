class ReviewsController < ApplicationController
  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)
  	@review.save!
  end
  
  def show

  end 

private
  def review_params
  	 params.require(:review).permit(:content)
  end
end
