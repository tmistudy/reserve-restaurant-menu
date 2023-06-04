class RestaurantsController < ApplicationController
  def home

  end

  def search
    if params[:area].present?
      @restaurants = Restaurant.where('area LIKE ?', "%#{params[:area]}%")
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = JSON.parse(@restaurant.menu)
  end
end
