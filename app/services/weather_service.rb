class WeatherService 

  def self.get_weather(latitude, longitude)
    response = connection.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&units=imperial") 
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params['appid'] = ENV['weather_api_key']
    end
  end
end