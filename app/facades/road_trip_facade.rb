class RoadTripFacade

  def self.get_roadtrip_info(start_point, end_point)
    travel = MapFacade.get_travel_time(start_point, end_point)
    hours = travel.split[0].to_i
    lat_lng = MapFacade.get_latitude_longitude(end_point)
    weather_after_travel = WeatherFacade.get_weather_summary_at_eta(lat_lng[:latitude], lat_lng[:longitude], hours)
    road_trip = RoadTrip.new(start_point, end_point, travel, weather_after_travel)
  end
  
end