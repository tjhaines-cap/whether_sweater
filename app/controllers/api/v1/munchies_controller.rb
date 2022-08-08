class Api::V1::MunchiesController < ApplicationController

  def index
    lat_lng = MapFacade.get_latitude_longitude(params[:location])
    weather = WeatherFacade.get_weather_summary(lat_lng[:latitude], lat_lng[:longitude])
    restaurant = YelpFacade.get_restaurant(params[:location], params[:food])
    render json: {
      data: {
        id: nil,
        type: "munchie",
        attributes: {
          destination_city: params[:location],
          forecaset: weather,
          restaurant: restaurant
        }
      }
    }
  end

end