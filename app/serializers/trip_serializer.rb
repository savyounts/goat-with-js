class TripSerializer < ActiveModel::Serializer
  attributes :id, :occasion, :start_date, :destinations, :completed, :user_id
  belongs_to :user
  has_many :destinations, serializer: TripDestinationSerializer
end
