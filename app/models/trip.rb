class Trip < ApplicationRecord
  belongs_to :user

  has_many :plans
  has_many :destinations, through: :plans

  def plan(destination_id)
    Plan.find_by(trip_id: self.id, destination_id: destination_id)
  end
end
