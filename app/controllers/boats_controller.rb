class BoatsController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :index, :search_by_city]


  def search_by_city
    # a = render "../views/pages/info_window"

    address = params[:city_name]
    @boats = Boat.near(address, 20)
    @markers = @boats.map do |boat|
    authorize boat
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: { content: "a" }
      }
    end
  end

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
  end

end



