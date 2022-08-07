class Api::V1::UsersController < ApplicationController

  def create
    binding.pry
    user = User.new(user_params)
    if user.save      
      render status: 201, json: UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end