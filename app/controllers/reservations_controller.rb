class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def reservation
    session[:reservation] = params
    redirect_to :reservation_confirm
  end

  def confirm
    @menu = session[:reservation]["list_array"]
    @menus = @menu.split(',').each_slice(3).to_a
    @reservation_date = session[:reservation]["reservation_date"]
    @reservation_hour = session[:reservation]["reservation_time(4i)"]
    @reservation_min = session[:reservation]["reservation_time(5i)"]
    @people = session[:reservation]["people"]
    @restaurant_id = session[:reservation]["restaurant_id"]
    if @menu.present? && @reservation_date.present? && @reservation_hour.present? && @reservation_min.present? && @people.present?
      @current_user = current_user.id
      @date_time = Time.parse(@reservation_date + " " + @reservation_hour + ":" + @reservation_min)
      @date = @reservation_date + " " + @reservation_hour + ":" + @reservation_min + ":00"
    else
      flash[:notice_fail] = "予約できませんでした。入力されてない箇所があります。"
      redirect_to "/restaurants/#{@restaurant_id}"
    end
  end

  def create
    @reservation = Reservation.new(params.permit(:menu,:total,:reservation_date,:people,:restaurant_id,:user_id))
    if @reservation.save
      flash[:notice_success] = "予約しました"
      redirect_to :home
    else
      flash.now[:notice_fail] = "予約できませんでした"
      render "confirm",status: :unprocessable_entity
    end
  end
end
