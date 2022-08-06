require 'rails_helper' 

RSpec.describe WeatherFacade do

  it 'returns weather objects from get weather' do
    weather_data = json = JSON.parse(File.read("spec/fixtures/weather.json"), symbolize_names: true)
    weather = Weather.new(weather_data)

    expect(weather).to be_a(Weather)
    expect(weather.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather) 
  end
end