class TripSerializer < ActiveModel::Serializer
  attributes :id, :occasion, :start_date, :destinations
  belongs_to :user
  has_many :destinations
end
