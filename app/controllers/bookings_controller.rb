class BookingsController < ApplicationController  
  before_action :set_booking, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: %i[update destroy]

  # GET /bookings or /bookings.json
  def index
    @user = current_user

    @bookings = Booking.all

    @booking = Booking.new
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @booking = Booking.find(params[:id])
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    @booking.update(booking_params)
    
    render json: { booking: @booking }.to_json
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    render plain: "OK"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:name, :subject, :start_time, :end_time, :user_id)
    end
end
