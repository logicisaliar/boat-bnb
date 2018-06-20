class BoatsController < ApplicationController

  def index
    # list the boats of the current user
    # @boats = Boat.where(user_id: current_user.id)
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :guests, :boat_type, :address, :price_day, :description, :photo_cache)
  end
end



