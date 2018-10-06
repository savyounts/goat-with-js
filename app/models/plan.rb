class Plan < ApplicationRecord
  belongs_to :trip
  belongs_to :destination

  accepts_nested_attributes_for :trip



end
