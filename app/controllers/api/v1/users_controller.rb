class Api::V1::UsersController < ApplicationController

  def create
    # binding.pry
    params[:api_key] = generate_api_key
    #insert check that if api key is duplicate it generates a different one
    user = User.new(user_params)
    # binding.pry
    if user.save      
      # render status: 201, json: {data: {type: "users", id: user.id, attributes: {email: user.email, api_key: user.api_key}}}
      render status: 201, json: UserSerializer.format_user(user)
    elsif user.errors.full_messages == ['Email has already been taken']
      render json: { error: 'That email is already in use! Please try again with a unique email.'}, status: 400
    elsif user.errors.full_messages == ["Email can't be blank"]
      render json: { error: 'Please enter an email.'}, status: 400
    elsif user.errors.full_messages == ["Password confirmation doesn't match Password"]
      render json: { error: 'Passwords do not match.'}, status: 400
    elsif user.errors.full_messages == ["Password can't be blank", "Password digest can't be blank"]
      render json: { error: 'Please enter a password.'}, status: 400
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