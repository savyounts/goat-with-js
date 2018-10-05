class PlansController < ApplicationController
  before_action :authenticate

  def new
    @plan = Plan.new(destination_id: params[:destination_id])
  end

  def create
    @plan = Plan.create(plan_params)
    redirect_to user_path(current_user)
  end

  def destroy

  end

  private

  def plan_params
    params.require(:plan).permit(:destination_id, :trip_id, trip_attributes: [:name, :user_id])
  end

end
