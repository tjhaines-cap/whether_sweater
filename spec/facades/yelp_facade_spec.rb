require 'rails_helper'

RSpec.describe YelpFacade do

  it 'returns the name and address for a restaurant given location and cuisine', :vcr do
    restaurant_data = YelpFacade.get_restaurant('denver,co', 'chinese')

    expect(restaurant_data).to be_a(Hash)
    expect(restaurant_data).to have_key(:destination_city)
    expect(restaurant_data).to have_key(:restaurant)
    restaurant = restaurant_data[:restaurant]
    expect(restaurant[:name]).to be_a(String)
    expect(restaurant[:address]).to be_a(String)
  end
end