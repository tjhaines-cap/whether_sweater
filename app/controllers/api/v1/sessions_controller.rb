class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:api_key] = user.api_key
      render status: 200, json: {data: {type: "users", id: user.id, attributes: {email: user.email, api_key: user.api_key}}}
    else
      render status: 404, json: {error: "Invalid Credentials"}
    end
  end

end