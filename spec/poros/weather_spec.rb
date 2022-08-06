require 'rails_helper' 

RSpec.describe Weather do

  it 'exists and has readable attributes' do
    json = JSON.parse(File.read("spec/fixtures/weather.json"), symbolize_names: true)
    weather_forecast = Weather.new(json)

    expect(weather_forecast).to be_a(Weather)
    expect(weather_forecast.attributes).to be_a(Hash)
    expect(weather_forecast.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather)
    current = weather_forecast.attributes[:current_weather]
    expect(current.keys).to include(:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon)
    daily = weather_forecast.attributes[:daily_weather]
    expect(daily.length).to eq(5)
    expect(daily[0].keys).to include(:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)
    hourly = weather_forecast.attributes[:hourly_weather]
    expect(hourly.length).to eq(8)
    expect(hourly[0].keys).to include(:time, :temperature, :conditions, :icon)
  end
end