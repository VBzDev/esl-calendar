class HomeController < ApplicationController
  def index
    
    @user = current_user

    @bookings = Booking.all

    return @booking = Booking.find(params[:id]) if params[:id].present?

    @booking = Booking.new
  end
end
