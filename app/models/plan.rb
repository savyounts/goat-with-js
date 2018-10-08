class Plan < ApplicationRecord
  belongs_to :trip
  belongs_to :destination

  accepts_nested_attributes_for :trip, reject_if: :reject_trip


  def reject_trip(attributes)
    attributes['occasion'].blank?
  end

end
