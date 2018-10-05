class Plan < ApplicationRecord
  belongs_to :trip
  belongs_to :destination

  def trip_attributes=(trip)
    t = current_user.trips.find_or_create_by(name: trip.name, user_id: trip.user_id)
    self.trip << t
  end
end
