class PlansController < ApplicationController
  before_action :require_login

  def new
    if !Destination.exists?(params[:destination_id])
      redirect_to destinations_path
    else
      @plan = Plan.new(destination_id: params[:destination_id])
      @plan.build_trip(user_id: current_user.id)
    end
  end

  def create
    @plan = Plan.create(plan_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @plan =  Plan.find_by(id: params[:id])
    @plan.destroy
    redirect_to user_path(current_user)
  end

  private

  def plan_params
    params.require(:plan).permit(:destination_id, :trip_id, trip_attributes: [:occasion, :user_id])
  end

end
