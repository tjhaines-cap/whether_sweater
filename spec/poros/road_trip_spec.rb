require 'rails_helper'

RSpec.describe RoadTrip do

  it 'exists and has readable attributes' do
    road_trip = RoadTrip.new("Denver, CO", "Estes Park, CO", "1 hours, 22 minutes", {:temperature=>74.5, :conditions=>"clear sky"})

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.id).to eq(nil)
    expect(road_trip.type).to eq("roadtrip")
    expect(road_trip.attributes[:start_city]).to eq("Denver, CO")
    expect(road_trip.attributes[:end_city]).to eq("Estes Park, CO")
    expect(road_trip.attributes[:travel_time]).to eq("1 hours, 22 minutes")
    expect(road_trip.attributes[:weather_at_eta]).to eq({:temperature=>74.5, :conditions=>"clear sky"})
  end
end