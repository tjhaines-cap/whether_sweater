require 'rails_helper'

RSpec.describe RoadTripFacade do

  describe '#get_roadtrip_info' do
    it 'returns travel time and weather forecast at location at time of arrival', :vcr do
      road_trip = RoadTripFacade.get_roadtrip_info("Denver, CO", "Estes Park, CO")

      expect(road_trip).to be_a(RoadTrip)
      expect(road_trip.start_city).to be_a(String)
      expect(road_trip.end_city).to be_a(String)
      expect(road_trip.travel_time).to be_a(String)
      expect(road_trip.weather_at_eta.keys).to include(:temperature, :conditions)
    end
  end
end