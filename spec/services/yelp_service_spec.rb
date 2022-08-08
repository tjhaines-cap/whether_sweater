require 'rails_helper'

RSpec.describe YelpService do

  it 'retrieves restaurants given a location and cuisine', :vcr do
    json = YelpService.get_restaurant("denver,co", "chinese")
    
    restaurant = json[:businesses][0]
    expect(restaurant).to have_key(:name)
    expect(restaurant).to have_key(:location)
    location = restaurant[:location]
    expect(location).to have_key(:display_address)
  end
end