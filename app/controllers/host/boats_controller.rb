class Host::BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
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
      redirect_to host_boats_path
    else
      render :new
    end
  end

  def destroy
    @boat.destroy
    redirect_to host_boats_path
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to host_boat_path(@boat)
    else
      render :edit
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :guests, :boat_type, :address, :price_day, :description, :photo_cache)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
