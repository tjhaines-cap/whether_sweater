class MunchiesFacade

  def self.get_restaurant_and_weather(location, cuisine)
    lat_lng = MapFacade.get_latitude_longitude(location)
    weather = WeatherFacade.get_weather_summary(lat_lng[:latitude], lat_lng[:longitude])
    restaurant = YelpFacade.get_restaurant(location, cuisine)
    result = {
      id: nil,
      type: "munchie",
      attributes: {
        destination_city: location,
        forecast: weather,
        restaurant: restaurant
      }
    }
  end
end