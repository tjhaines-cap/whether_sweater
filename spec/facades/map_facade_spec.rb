require 'rails_helper'

RSpec.describe MapFacade do

  it 'returns the latitude and longitude when given a city', :vcr do
    lat_lng = MapFacade.get_latitude_longitude("Manitou Springs, CO")

    expect(lat_lng[:latitude])to eq(38.857568)
    expect(lat_lng[:longitude]).to have_key(-104.912311)
  end
end