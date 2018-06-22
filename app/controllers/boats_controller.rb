class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :search_by_city]


  def search_by_city
    address = params[:address]
    @boats = Boat.near(address, 2000)
    @other_boats = []
    Boat.all.each do |boat|
      unless @boats.include?(boat)
        @other_boats << boat
      end
    end
    @markers = @boats.map do |boat|
      authorize boat
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: { content: render_to_string(partial: "/shared/mapbox", locals: { boat: boat }) }
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


