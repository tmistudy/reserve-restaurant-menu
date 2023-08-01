class RestaurantsController < ApplicationController
  def home
  end

  def search
    if params[:area_or_menu].present?
      @restaurants = Restaurant.where('name LIKE(?) OR area LIKE(?) OR address LIKE(?) OR genre LIKE(?)', "%#{params[:area_or_menu]}%","%#{params[:area_or_menu]}%","%#{params[:area_or_menu]}%","%#{params[:area_or_menu]}%")
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = JSON.parse(@restaurant.menu)
  end
end
