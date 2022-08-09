class RoadTrip

  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start_point, end_point, travel_time, weather_at_location)
    @start_city = start_point
    @end_city = end_point
    @travel_time = travel_time
    @weather_at_eta = weather_at_location
  end

end