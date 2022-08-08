class Api::V1::MunchiesController < ApplicationController

  def index
    if params[:location] && params[:food]
      if params[:location] == "" || params[:food] == ""
        render status: 400
      else
        response = MunchiesFacade.get_restaurant_and_weather(params[:location], params[:food])
        render json: {data: response}
      end
    else
      render status: 400
    end
  end

end