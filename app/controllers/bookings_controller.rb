class BookingsController < ApplicationController
  before_action :set_boat

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    authorize @booking
    if @booking.save
      redirect_to boat_booking_path(boat_id: @boat.id, id: @booking.id)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :boat_id)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

end
