require 'rails_helper' 

RSpec.describe 'Gets' do

  describe 'GET /api/v1/munchies' do
    it 'returns a hash with restaurant data and weather data', :vcr do
      get '/api/v1/munchies?location=denver,co&food=chinese'

      munchie_response = JSON.parse(response.body, symbolize_names: true)
      expect(munchie_response).to be_a(Hash)
      expect(munchie_response[:id]).to eq(nil)
      expect(munchie_response[:type]).to eq("munchie")
      expect(munchie_response[:attributes]).to be_a(Hash)
      expect(munchie_response[:attributes]).to have_key(:destination_city)
      forecast = munchie_response[:attributes][:forecast]
      restaurant = munchie_response[:attributes][:restaurant]
      expect(forecast.keys.length).to eq(2)
      expect(forecast.keys).to include(:summary, :temperature)
      expect(restaurant.keys.length).to eq(2)
      expect(restaurant.keys).to include(:name, :address)
    end
  end
end