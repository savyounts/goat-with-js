class DestinationsController < ApplicationController
  before_action :require_login, :current_user
  skip_before_action :require_login, :only => [:index, :show]

  def index
    if params[:user_id] && current_user == User.find_by(id: params[:id])
      @destinations = current_user.custom_destinations
    else
      @destinations = Destination.all
    end
  end

  def new
    @destination = current_user.custom_destinations.build
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      @destination.creator = current_user
      redirect_to destination_path(@destination)
    else
      render 'new'
    end
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
    current_user
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
