class TripSerializer < ActiveModel::Serializer
  attributes :id, :occasion, :start_date, :destinations, :completed
  belongs_to :user
  has_many :destinations, serializer: TripDestinationSerializer
end
