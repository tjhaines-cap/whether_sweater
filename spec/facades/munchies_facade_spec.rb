require 'rails_helper'

RSpec.describe MunchiesFacade do

  describe '#get_restaurant_and_weather' do
    it 'returns a hash with restaurant and weather data based on a location and cuisine type', :vcr do
      result = MunchiesFacade.get_restaurant_and_weather("denver,co", "chinese")

      expect(result).to be_a(Hash)
      expect(result[:id]).to eq(nil)
      expect(result[:type]).to eq("munchie")
      expect(result[:attributes]).to be_a(Hash)
      expect(result[:attributes]).to have_key(:destination_city)
      forecast = result[:attributes][:forecast]
      restaurant = result[:attributes][:restaurant]
      expect(forecast.keys.length).to eq(2)
      expect(forecast.keys).to include(:summary, :temperature)
      expect(restaurant.keys.length).to eq(2)
      expect(restaurant.keys).to include(:name, :address)
    end
  end
end