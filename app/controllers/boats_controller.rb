class BoatsController < ApplicationController

  def search_by_city
    address = params[:city_name]
    @boats = Boat.near(address, 20)
    # @boats = Boat.where.not(latitude: nil, longitude: nil)
    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/boats/map_box", locals: { boat: flat }) }
      }
    end
  end

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



