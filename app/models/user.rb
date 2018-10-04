class User < ApplicationRecord
  has_many :trips

  has_many :custom_destinations, class_name: "Destination", foreign_key: "creator_id"

  has_secure_password

  # scope :destinations,

  def destinations
    binding.pry
    destinations = []
    self.trips.collect {|trip| destinations << trip.destinations}
  end
end
