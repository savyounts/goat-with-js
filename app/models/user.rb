class User < ApplicationRecord
  has_many :trips
  has_many :comments

  has_many :custom_destinations, class_name: "Destination", foreign_key: "creator_id"

  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness:{case_sensitive: false}


  def self.find_or_create_by_omniauth(auth_hash)
     self.where(email: auth_hash["info"]["email"]).first_or_create do |u|
      u.username = auth_hash.info.name
      u.password = SecureRandom.hex
    end
  end

end
