class ReservationsController < ApplicationController
  def reservation
    session[:reservation] = params
    # binding.pry
    redirect_to :reservation_confirm
  end

  def confirm
  end
end
