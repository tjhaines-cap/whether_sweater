require 'rails_helper'

RSpec.describe "Posts" do

  describe "Post /road_trip" do
    describe "happy path" do
      before :each do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }
        
        post '/api/v1/sessions', params: {
                                "email": "whatever@example.com",
                                "password": "password"
                              }

        user_data = JSON.parse(response.body, symbolize_names: true)
        user = user_data[:data]                      
        @api_key = user[:attributes][:api_key]
      end

      it 'returns the start city, end city, travel time, and weather at location at eta', :vcr do
        post '/api/v1/road_trip', params: {
                                    "origin": "Denver,CO",
                                    "destination": "Pueblo,CO",
                                    "api_key": @api_key
                                  }
# binding.pry
        expect(response.status).to eq(200)
        road_trip_data = JSON.parse(response.body, symbolize_names: true)
        road_trip = road_trip_data[:data]
        expect(road_trip[:id]).to eq(nil)
        expect(road_trip[:type]).to eq("roadtrip")
        expect(road_trip[:attributes].keys.length).to eq(4)
        attributes = road_trip[:attributes]
        expect(attributes[:start_city]).to eq("Denver,CO")
        expect(attributes[:end_city]).to eq("Pueblo,CO")
        expect(attributes[:travel_time]).to be_a(String)
        expect(attributes[:weather_at_eta][:temperature]).to be_a(Float)
        expect(attributes[:weather_at_eta][:conditions]).to be_a(String)
      end
    end
  end
end