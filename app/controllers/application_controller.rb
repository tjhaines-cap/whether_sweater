class ApplicationController < ActionController::API

  def valid_api_key?(api_key)
    if api_key
      session[:api_key] == api_key
    else
      return false
    end
  end

end
