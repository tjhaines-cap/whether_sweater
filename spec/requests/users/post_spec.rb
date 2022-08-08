require 'rails_helper'

RSpec.describe "Posts" do

  describe "POST /users" do
    it 'returns data hash with user email, api_key, and id', :vcr do
      post '/api/v1/users', params: {
                              email: "whatever@example.com",
                              password: "password",
                              password_confirmation: "password"
                            }

      user_data = JSON.parse(response.body, symbolize_names: true)
      user = user_data[:data]
      expect(user[:type]).to eq("users")
      expect(user[:id]).to be_a(Integer)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes][:api_key]).to be_a(String)
    end
  end
end