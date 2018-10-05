class TripsController < ApplicationController
  before_action :authenticate


  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to user_trip_path(current_user, @trip)
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
  end

  def show
    @trip =  Trip.find_by(id: params[:id])
  end

  def destroy
    @trip =  Trip.find_by(id: params[:id])
    @trip.destroy
    redirect_to user_path(current_user)
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :user_id, :start_date, :completed)
    end
end
