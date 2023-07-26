class MypagesController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @reservations = Restaurant.joins(:reservations).select("restaurants.*,reservations.*,reservations.id AS reserve_id").where(reservations: { user_id: current_user.id })
  end

  def detail
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(@reservation.restaurant_id)
    @menus = @reservation.menu.gsub(" ", ",").split(',').each_slice(3).to_a
  end
end
