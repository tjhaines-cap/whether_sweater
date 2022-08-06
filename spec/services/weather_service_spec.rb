require 'rails_helper'

RSpec.describe WeatherService do

  it 'can retrieve weather data from OpenWeather API', :vcr do
    weather_json = WeatherService.get_weather(38.8576, 104.9128) 

    expect(weather_json.keys).to include(:current, :daily, :hourly)
    current = weather_json[:current]
    expect(current.keys).to include(:dt, :sunrise)
  end
end