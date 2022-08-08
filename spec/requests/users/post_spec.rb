require 'rails_helper'

RSpec.describe "Posts" do

  describe "POST /users" do
    describe "happy path" do
      it 'returns data hash with user email, api_key, and id', :vcr do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }

        expect(response.status).to eq(201)
        user_data = JSON.parse(response.body, symbolize_names: true)
        user = user_data[:data]
        expect(user[:type]).to eq("users")
        expect(user[:id]).to be_a(Integer)
        expect(user[:attributes][:email]).to be_a(String)
        expect(user[:attributes][:api_key]).to be_a(String)
      end
    end

    describe "sad path" do
      it 'returns error if passwords do not match', :vcr do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "pas"
                              }
        json = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(json[:error]).to eq("Passwords do not match.")
      end

      it 'returns error if email is already in use', :vcr do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(json[:error]).to eq("That email is already in use! Please try again with a unique email.")
      end

      it 'returns an error if password field is blank', :vcr do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "",
                                password_confirmation: ""
                              }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(json[:error]).to eq("Please enter a password.")
      end

      it 'returns an error if email field is blank', :vcr do
        post '/api/v1/users', params: {
                                email: "",
                                password: "pass",
                                password_confirmation: "pass"
                              }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(json[:error]).to eq("Please enter an email.")
      end
    end
  end
end