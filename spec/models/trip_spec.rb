require 'rails_helper'

RSpec.describe Trip, :type => :model do

  let(:user) {
    User.create(
      :username => "Mindy",
      :password => "password",
    )
  }

  let(:trip) {
    Trip.create(
      :name => "Honeymoon",
      :user_id => user.id,
      :start_date => "Nov 1, 2018"
    )
  }

  it "is valid with a name and user_id" do
    expect(trip).to be_valid
  end

  it "has many plans" do
    user2 = User.create(username: "Max Charles", password: "password")
    spain = Destination.create(name: "spain", creator_id: user2.id)
    plan = Plan.create(trip_id: trip.id, destination_id: spain.id)
    expect(trip.plans.first).to eq(plan)
  end

  it "belongs to a user" do
    user2 = User.create(username: "Max Charles", password: "password")
    user2.trips << trip
    expect(trip.user).to eq(user2)
  end

  it "has many destinations through plans" do
    spain = Destination.create(name: "spain", creator_id: user.id)
    norway = Destination.create(name: "norway", creator_id: user.id)
    trip.destinations << [spain, norway]

    expect(trip.destinations.first).to eq(spain)
    expect(trip.destinations.last).to eq(norway)
  end

end
