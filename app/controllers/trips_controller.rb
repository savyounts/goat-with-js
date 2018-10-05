class TripsController < ApplicationController
  before_action :require_login


  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      current_user.trips << @trip
      redirect_to user_trip_path(current_user, @trip)
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find_by(id: params[:id])
    trip.update(trip_params)
    redirect_to user_trip_path(current_user, trip)
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
