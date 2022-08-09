class Api::V1::RoadTripsController < ApplicationController

  def create
    if valid_api_key?(params[:api_key]) || User.find_by(api_key: params[:api_key])
      # travel = MapFacade.get_travel_time(params[:origin], params[:destination])
      # hours = travel.split[0].to_i
      # lat_lng = MapFacade.get_latitude_longitude(params[:destination])
      # weather_after_travel = WeatherFacade.get_weather_summary_at_eta(lat_lng[:latitude], lat_lng[:longitude], hours)
      # road_trip = RoadTrip.new(params[:origin], params[:destination], travel, weather_after_travel)
      # render json: {data: {id: nil, type: "roadtrip", attributes: {start_city: params[:origin], end_city: params[:destination], travel_time: travel, weather_at_eta: weather_after_travel}}}
      road_trip = RoadTripFacade.get_roadtrip_info(params[:origin], params[:destination])
      render json: {data: road_trip}
    else
      render status: 401, json: {error: "Unauthorized"}
    end
  end

end