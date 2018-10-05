class User < ApplicationRecord
  has_many :trips

  has_many :custom_destinations, class_name: "Destination", foreign_key: "creator_id"

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness:{case_sensitive: false, message: "this username is already taken"}
  validates :password, presence: true
  validates :password_confirmation, presence: true


  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    @user = User.find_or_create_by(email: oauth_email) do |u|
      u.username = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.hex
    end
  end

  # scope :destinations,

  # def destinations
  #   # binding.pry
  #   destinations = []
  #   self.trips.each {|trip| destinations << trip.destinations}.flatten
  # end
end
