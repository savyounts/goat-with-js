class User < ApplicationRecord
  has_many :trips
  has_many :destinations, through: :trips
  has_many :custom_destinations, class_name: "Destination", foreign_key: "creator_id"
end
