class ApplicationController < ActionController::API

  def valid_api_key?(api_key)
    session[:api_key] == api_key
  end

end
