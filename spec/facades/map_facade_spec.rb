require 'rails_helper'

RSpec.describe MapFacade do

  it 'returns the latitude and longitude when given a city', :vcr do
    lat_lng = MapFacade.get_latitude_longitude("Manitou Springs, CO")
    
    expect(lat_lng[:latitude]).to eq(38.857568)
    expect(lat_lng[:longitude]).to eq(-104.912311)
  end

  it 'returns the travel time given a start and end point', :vcr do
    travel_time = MapFacade.get_travel_time("Denver, CO", "Estes Park, CO")
    
    expect(travel_time).to eq("1 hours, 22 minutes")
  end
end