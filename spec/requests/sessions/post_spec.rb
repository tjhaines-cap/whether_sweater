require 'rails_helper' 

RSpec.describe 'Posts' do

  describe 'POST /sessions' do
    describe 'happy path' do
      it 'returns the email and api_key of a user when they log in', :vcr do
        post '/api/v1/users', params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }
        
        post '/api/v1/sessions', params: {
                                "email": "whatever@example.com",
                                "password": "password"
                              }

        expect(response.status).to eq(200)
        user_data = JSON.parse(response.body, symbolize_names: true)
        user = user_data[:data]
        expect(user[:type]).to eq("users")
        expect(user[:id]).to be_a(Integer)
        expect(user[:attributes][:email]).to be_a(String)
        expect(user[:attributes][:api_key]).to be_a(String)
      end
    end
  end
end