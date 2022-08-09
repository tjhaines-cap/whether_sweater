class Api::V1::RoadTripsController < ApplicationController

  def create
    if valid_api_key?(params[:api_key]) || User.find_by(api_key: params[:api_key])
      road_trip = RoadTripFacade.get_roadtrip_info(params[:origin], params[:destination])
      render json: RoadTripSerializer.format_road_trip(road_trip)
    else
      render status: 401, json: {error: "Unauthorized"}
    end
  end

end