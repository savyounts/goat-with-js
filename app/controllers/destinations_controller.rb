class DestinationsController < ApplicationController
  before_action :require_login
  skip_before_action :logged_in?, :only => [:index, :show]

  def index
    @destinations = Destination.all
  end

  def new
    @destination = current_user.custom_destinations.build
  end

  def create
    @destination = Destination.create(destination_params)
    @destination.creator = current_user
    redirect_to destination_path(@destination)
  end

  def edit
    @destination = Destination.find_by(id: params[:id])
  end

  def update
    @destination = Destination.find_by(id: params[:id])
    @destination.update(destination_params)
    redirect_to destination_path(@destination)
  end

  def show
    @destination = Destination.find_by(id: params[:id])
  end

  def destroy
    @destination = Destination.find_by(id: params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

private
  def destination_params
    params.require(:destination).permit(:name, :city, :country, :description, :creator_id, :must_dos, :dont_dos, :day_trips, :image_url)
  end
end
