class DestinationsController < ApplicationController

  def index
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    @destination.creator = current_user
    redirect_to destination_path(@destination)
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def destination_params
    params.require(:destination).permit(:name, :city, :country, :description, :creator_id, :must_dos, :dont_dos, :day_trips, :image_url)
  end
end
