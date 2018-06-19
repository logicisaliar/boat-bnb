class BoatsController < ApplicationController

  def new
    @boat = Boat.new
    @boat.user = current_user
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to host_boats_path
    else
      render :new
    end
  end

private
  def boat_params
    params.require(:boat).permit(:name, :guests, :boat_type, :address, :price_day, :description)
  end
end
