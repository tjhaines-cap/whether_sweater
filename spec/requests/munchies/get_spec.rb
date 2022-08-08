require 'rails_helper' 

RSpec.describe 'Gets' do

  describe 'GET /api/v1/munchies' do
    it 'returns a hash with restaurant data and weather data', :vcr do
      get '/api/v1/munchies?location=denver,co&food=chinese'

      munchie_response = JSON.parse(response.body, symbolize_names: true)
      munchie_data  = munchie_response[:data]
      expect(munchie_data).to be_a(Hash)
      expect(munchie_data[:id]).to eq(nil)
      expect(munchie_data[:type]).to eq("munchie")
      expect(munchie_data[:attributes]).to be_a(Hash)
      expect(munchie_data[:attributes]).to have_key(:destination_city)
      expect(munchie_data[:attributes][:destination_city]).to be_a(String)
      forecast = munchie_data[:attributes][:forecast]
      restaurant = munchie_data[:attributes][:restaurant]
      expect(forecast.keys.length).to eq(2)
      expect(forecast.keys).to include(:summary, :temperature)
      expect(restaurant.keys.length).to eq(2)
      expect(restaurant.keys).to include(:name, :address)
    end

    it 'returns error code if either parameter is not given', :vcr do
      get '/api/v1/munchies?location=denver,co'

      expect(response.status).to eq(400)
      
      get '/api/v1/munchies?location=denver,co&food='
      
      expect(response.status).to eq(400)
    end
  end
end