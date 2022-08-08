require 'rails_helper'

RSpec.describe YelpFacade do

  it 'returns the name and address for a restaurant given location and cuisine' do
    restaurant = YelpFacade.get_restaurant('denver,co', 'chinese')

    expect(restaurant).to be_a(Hash)
    expect(restaurant).to have_key(:name)
    expect(restaurant).to have_key(:address)
  end
end