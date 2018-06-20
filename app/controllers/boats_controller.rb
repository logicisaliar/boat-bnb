class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def search_by_city
    address = params[:city_name]
    raise
    @boats = Boat.near(address, 20)
    # @boats = Boat.where.not(lat: nil, lon: nil)
    @markers = @boats.map do |boat|
      {
        lat: boat.lat,
        lng: boat.lon#,
        # infoWindow: { content: render_to_string(partial: "/boats/map_box", locals: { boat: flat }) }
      }
    end

  end

  def index
    # list the boats of the current user
    # @boats = Boat.where(user_id: current_user.id)
    @boats = current_user.owned_boats
  end

  def show
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boat_path(@boat)
    else
      render :edit
    end
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

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :guests, :boat_type, :address, :price_day, :description, :photo_cache)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end



