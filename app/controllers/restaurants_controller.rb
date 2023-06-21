class RestaurantsController < ApplicationController
  def home
  end

  def search
    if params[:area].present?
      @restaurants = Restaurant.where('area LIKE ?', "%#{params[:area]}%")
      session[:area] = params[:area]
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = JSON.parse(@restaurant.menu)
    params[:area] = session[:area]
  end
end
