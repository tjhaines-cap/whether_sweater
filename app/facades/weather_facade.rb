class WeatherFacade 

  def self.get_weather(latitude, longitude)
    weather_json = WeatherService.get_weather(latitude, longitude)
    Weather.new(weather_json)
  end 

  def self.get_weather_summary_at_eta(latitude, longitude, hours)
    weather_json = WeatherService.get_weather(latitude, longitude)
    if hours <= 48
      summary = {
        temperature: weather_json[:hourly][hours][:temp],
        conditions: weather_json[:hourly][hours][:weather][0][:description]
      }
      return summary
    else
      days = hours / 24
      summary = {
        temperature: weather_json[:daily][days][:temp][:day],
        conditions: weather_json[:daily][days][:weather][0][:description]
      }
      return summary
    end
  end
end