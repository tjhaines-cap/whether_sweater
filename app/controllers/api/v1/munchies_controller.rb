class Api::V1::MunchiesController < ApplicationController

  def index
    response = MunchiesFacade.get_restaurant_and_weather(params[:location], params[:food])
    render json: response
  end

end