class WeatherFacade 

  def self.get_weather(latitude, longitude)
    weather_json = WeatherService.get_weather(latitude, longitude)
    Weather.new(weather_json)
  end 

  def self.get_weather_summary(latitude, longitude)
    weather_json = WeatherService.get_weather(latitude, longitude)
    weather_summary = {
      summary: weather_json[:current][:weather][0][:description],
      temperature: weather_json[:current][:temp]
    }
  end
end