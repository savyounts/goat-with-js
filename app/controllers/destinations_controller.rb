class DestinationsController < ApplicationController
  before_action :require_login, :current_user, :set_destination
  skip_before_action :require_login, :only => [:index]
  skip_before_action :set_destination, :only => [:index, :new, :create]


  def index
    if params[:user_id] && current_user == User.find_by(id: params[:user_id])
      @destinations = current_user.custom_destinations
    else
      @destinations = Destination.all
    end
    respond_to do |format|
      format.html {render :layout => "application"}
      format.json {render json: @destinations}
    end
  end


  def new
    @destination = current_user.custom_destinations.build
    render :layout => "application"
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
    render :layout => "application"
  end

  def update
    @destination.update(destination_params)
    redirect_to destination_path(@destination)
  end

  def show
    @last = Destination.last
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @destination}
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end

private
  def destination_params
    params.require(:destination).permit(:name, :city, :country, :description, :creator_id, :must_dos, :dont_dos, :day_trips, :image_url)
  end

end
