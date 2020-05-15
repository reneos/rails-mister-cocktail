class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @dose = Dose.new # needed in case there's an error and the page is re-rendered
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:username, :content, :rating)
  end
end
