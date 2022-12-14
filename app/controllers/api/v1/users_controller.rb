class Api::V1::UsersController < ApplicationController

  def create
    params[:api_key] = generate_api_key
    user = User.new(user_params)
    if user.save      
      render status: 201, json: UserSerializer.format_user(user)
    elsif user.errors.full_messages == ['Email has already been taken']
      render json: { error: 'That email is already in use! Please try again with a unique email.'}, status: 400
    elsif user.errors.full_messages == ["Email can't be blank"]
      render json: { error: 'Please enter an email.'}, status: 400
    elsif user.errors.full_messages == ["Password confirmation doesn't match Password"]
      render json: { error: 'Passwords do not match.'}, status: 400
    elsif user.errors.full_messages.include?("Password can't be blank") || user.errors.full_messages.include?("Password digest can't be blank")
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