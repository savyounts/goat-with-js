class Trip < ApplicationRecord
  belongs_to :user

  has_many :planned_destinations
  has_many :destinations, through: :planned_destinations
end
