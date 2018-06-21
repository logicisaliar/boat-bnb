class Host::BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]


  def index
    @boats = policy_scope(Boat).order(created_at: :desc)
    @boats = current_user.owned_boats
  end

  def show
    authorize @boat
  end

  def new
    @boat = Boat.new
    @boat.user = current_user
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to host_boats_path
    else
      render :new
    end
  end

  def destroy
    authorize @boat
    @boat.destroy
    redirect_to host_boats_path
  end

  def edit
    authorize @boat
  end

  def update
    authorize @boat
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
