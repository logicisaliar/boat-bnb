class BookingsController < ApplicationController

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :boat_id)
  end

end
