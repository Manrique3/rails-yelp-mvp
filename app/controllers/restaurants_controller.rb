class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurants_params)
      redirect_to restaurants_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurantss_path, status: :see_other
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
