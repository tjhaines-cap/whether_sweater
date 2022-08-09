require 'rails_helper'

RSpec.describe RoadTrip do

  it 'exists and has readable attributes' do
    road_trip = RoadTrip.new("Denver, CO", "Estes Park, CO", "1 hours, 22 minutes", {:temperature=>74.5, :conditions=>"clear sky"})

    expect(road_trip).to be_a(RoadTrip)
    expect(raod_trip.id).to eq(nil)
    expect(raod_trip.id).to eq("roadtrip")
    expect(raod_trip.attributes[:start_city]).to eq("Denver, CO")
    expect(raod_trip.attributes[:end_city]).to eq("Estes Park, CO")
    expect(raod_trip.attributes[:travel_time]).to eq("1 hours, 22 minutes")
    expect(raod_trip.attributes[:weather_at_eta]).to eq({:temperature=>74.5, :conditions=>"clear sky"})
  end
end