class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :trips
  has_many :custom_destinations
  has_many :comments
end
