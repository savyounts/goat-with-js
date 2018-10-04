class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    @trip.user = current_user
    redirect_to trip_path(@trip)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
