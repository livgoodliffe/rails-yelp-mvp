class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:create, :new]

  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = @restaurant

      if @review.save
        redirect_to @review.restaurant, notice: 'Review was successfully created.'
      else
        render :new
      end

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
