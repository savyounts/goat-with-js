class User < ApplicationRecord
  has_many :trips

  has_many :custom_destinations, class_name: "Destination", foreign_key: "creator_id"

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness:{case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true

  # scope :destinations,

  # def destinations
  #   # binding.pry
  #   destinations = []
  #   self.trips.each {|trip| destinations << trip.destinations}.flatten
  # end
end
