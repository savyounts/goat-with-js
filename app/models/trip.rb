class Trip < ApplicationRecord
  belongs_to :user

  has_many :plans
  has_many :destinations, through: :plans
end
