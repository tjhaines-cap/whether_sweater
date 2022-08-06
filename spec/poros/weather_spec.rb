require 'rails_helper' 

RSpec.describe Weather do

  it 'exists and has readable attributes' do
    json = JSON.parse(File.read("spec/fixtures/weather.json"), symbolize_names: true)
    weather_forecast = Weather.new(json)

    expect(weather_forecast).to be_a(Weather)
    expect(weather_forecast.attributes).to be_a(Hash)
    expect(weather_forecast.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather)
  end
end