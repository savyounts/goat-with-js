class Destination < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

    has_many :planned_destinations
    has_many :trips, through: :planned_destinations
end
