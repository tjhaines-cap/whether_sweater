class Api::V1::ForecastsController < ApplicationController

  def index
    if params[:location] == nil || params[:location] == ""
      render json: {error: "Please provide a location."}, status: 400
    else
      lat_lng = MapFacade.get_latitude_longitude(params[:location])
      weather = WeatherFacade.get_weather(lat_lng[:latitude], lat_lng[:longitude])
      render json: {data: weather}
    end
  end

end