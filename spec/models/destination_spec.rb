require 'rails_helper'

RSpec.describe Destination, :type => :model do

  let(:user) {
    User.create(
      :username => "Mindy",
      :password => "password",
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

  it "is valid with a name, city, country, description and creator_id" do
    expect(spain).to be_valid
  end

  it "has many plans" do
    trip = Trip.create(user_id: user.id, :name => "honeymoon")
    plan = Plan.create(:trip_id => trip.id, destination_id: spain.id)
    expect(spain.plans.first).to eq(plan)
  end

  it "has many trips through plans" do
    trip = Trip.create(user_id: user.id, :name => "honeymoon")
    trip2 = Trip.create(user_id: user.id,:name => "girls week")
    spain.trips << [trip, trip2]

    expect(spain.trips.first).to eq(trip)
    expect(spain.trips.last).to eq(trip2)
  end

end
