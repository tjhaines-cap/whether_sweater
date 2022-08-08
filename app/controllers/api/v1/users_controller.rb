class Api::V1::UsersController < ApplicationController

  def create
    # binding.pry
    params[:api_key] = generate_api_key
    # binding.pry
    #insert check that if api key is duplicate it generates a different one
    user = User.new(user_params)
    if user.save      
      render status: 201, json: {data: {type: "users", id: user.id, attributes: {email: user.email, api_key: user.api_key}}}
    else
      render status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end

  def generate_api_key
    key = SecureRandom.hex(20)
  end
end