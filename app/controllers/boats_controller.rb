class BoatsController < ApplicationController

  def index
    # list the boats of the current user
    # @boats = Boat.where(user_id: current_user.id)
    @boats = current_user.owned_boats
  end


  def new
    @boat = Boat.new
    @boat.user = current_user
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

private
  def boat_params
    params.require(:boat).permit(:name, :guests, :boat_type, :address, :price_day, :description)
  end
end
