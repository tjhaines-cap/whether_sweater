class WeatherFacade 

  def self.get_weather(location)
    weather_json = WeatherService.get_weather(location)
    Weather.new(weather_json)
  end 
end