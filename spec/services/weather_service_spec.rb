require 'rails_helper'

RSpec.describ WeatherService do

  it 'can retrieve weather data from OpenWeather API', :vcr do
    weather_json = WeatherService.get_weather(latitude, longitude) 

    expect(weather_json).to have_keys(:current, :daily, :hourly)
    current = weather_json[:current]
    expect(current).to have_keys(:dt, :sunrise)
  end
end