require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :username => "Mindy",
      :password => "password",
    )
  }

  let(:user2) {
    User.create(
      :username => "sav",
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
      :creator_id => user2.id
    )
  }

  let(:trolltunga) {
    Destination.create(
      :name => "Trolltunga",
      :city => "Odda",
      :country => "Norway",
      :description => "such hike. so long",
      :must_dos => "hike it",
      :day_trips => "bergen",
      :dont_dos => "skip out"
    )
  }

  it "is valid with a name & password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(username: "Name")).not_to be_valid
  end

  it "has many custom_destinations" do
    first_destination = Destination.create(:creator_id => user.id, :name => "spain")
    second_destination = Destination.create(:creator_id => user.id, :name => "Portugal")
    expect(user.custom_destinations.first).to eq(first_destination)
    expect(user.custom_destinations.last).to eq(second_destination)
  end

  it "has many trips" do
    first_trip = Trip.create(:user_id => user.id, :name => "honeymoon")
    plan = Plan.create(:trip_id => first_trip.id, destination_id: spain.id)
    second_trip = Trip.create(:user_id => user.id, :name => "girls week")
    plan = Plan.create(:trip_id => second_trip.id, destination_id: trolltunga.id)
    expect(user.trips.first).to eq(first_trip)
    expect(user.trips.last).to eq(second_trip)
  end

  # it "has method to find destinations through trips" do
  #   first_trip = Trip.create(:user_id => user.id, :name => "honeymoon")
  #   plan = Plan.create(:trip_id => first_trip.id, destination_id: spain.id)
  #   second_trip = Trip.create(:user_id => user.id, :name => "girls week")
  #   plan2 = Plan.create(:trip_id => second_trip.id, destination_id: trolltunga.id)
  #   expect(user.destinations.first).to eq(spain)
  #   expect(user.destinations.last).to eq(trolltunga)
  # end

end
