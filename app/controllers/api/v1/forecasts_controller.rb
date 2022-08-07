class Api::V1::ForecastsController < ApplicationController

  def index
    lat_lng = MapFacade.get_latitude_longitude(params[:location])
    weather = WeatherFacade.get_weather(lat_lng[:latitude], lat_lng[:longitude])
    render json: {data: weather}
  end

end