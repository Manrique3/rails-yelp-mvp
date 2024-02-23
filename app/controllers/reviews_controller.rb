class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
