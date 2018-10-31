class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :description, :must_dos, :day_trips, :dont_dos, :creator_id
  has_many :comments
  has_many :trips
end
