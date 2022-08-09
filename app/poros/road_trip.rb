class RoadTrip

  attr_reader :id, :type, :attributes

  def initialize(start_point, end_point, travel_time, weather_at_location)
    @id = nil
    @type = "roadtrip"
    @attributes = {
      start_city: start_point,
      end_city: end_point,
      travel_time: travel_time,
      weather_at_eta: weather_at_location
    }
  end

end