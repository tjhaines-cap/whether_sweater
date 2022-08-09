class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:api_key] = user.api_key
      render status: 200, json: UserSerializer.format_user(user)
    else
      render status: 404, json: {error: "Invalid Credentials"}
    end
  end

end