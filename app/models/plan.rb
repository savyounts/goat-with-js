class Plan < ApplicationRecord
  belongs_to :trip
  belongs_to :destination

  def trip_attributes=(trip)
    t = current_user.trips.find_or_create_by(name: trip.name)
    t.user = current_user
    self.trip << t
  end
end
