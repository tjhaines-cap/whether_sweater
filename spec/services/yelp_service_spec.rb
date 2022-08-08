require 'rails_helper'

RSpec.describe YelpService do

  it 'retrieves restaurants given a location and cuisine', :vcr do
    json = YelpService.get_restaurant(location, cuisine)

    restaurant = json[:businesses][0]
    expect(restaurant).to have_key(:name)
    expect(restaurant).to have_key(:location)
    location = restaurant[:location]
    expect(location).to have_key(:address1)
    expect(location).to have_key(:city)
    expect(location).to have_key(:state)
    expect(location).to have_key(:zip_code)
  end
end