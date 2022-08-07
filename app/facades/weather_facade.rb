class WeatherFacade 

  def self.get_weather(latitude, longitude)
    weather_json = WeatherService.get_weather(latitude, longitude)
    Weather.new(weather_json)
  end 
end