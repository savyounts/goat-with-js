require 'rails_helper'

RSpec.describe Plan, :type => :model do

  let(:user) {
    User.create(
      :username => "Mindy",
      :password => "password"
    )
  }

  let(:spain) {
    Destination.create(
      :name => "Barca",
      :city => "Barcelona",
      :country => "Spain",
      :description => "oh so pretty",
      :must_dos => "beaches",
      :day_trips => "porto",
      :dont_dos => "ski",
      :creator_id => user.id
    )
  }

  let(:honeymoon) {
    Trip.create(
      :name => "Trolltunga",
      :user_id => user.id,
      :start_date => "Nov 1"
    )
  }

  let(:plan) {
    Plan.create(trip_id: honeymoon.id, destination_id: spain.id)
  }

  it "is valid with a trip_id and a destination_id" do
    expect(plan).to be_valid
  end

  it "belongs to one trip" do
    expect(plan.trip).to eq(honeymoon)
  end

  it "belongs to one destination" do
    expect(plan.destination).to eq(spain)
  end

end
