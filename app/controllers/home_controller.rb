class HomeController < ApplicationController
  def index
    
    @user = current_user

    @bookings = Booking.all

    @booking = Booking.new
  end
end
