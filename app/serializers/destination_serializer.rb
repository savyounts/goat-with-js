class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :country, :description, :must_dos, :day_trips, :dont_dos
  has_many :comments
end
