require 'rails_helper' 

RSpec.describe WeatherFacade do

  it 'returns weather objects from get weather' do
    weather_data = JSON.parse(File.read("spec/fixtures/weather.json"), symbolize_names: true)
    weather = Weather.new(weather_data)

    expect(weather).to be_a(Weather)
    expect(weather.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather) 
  end

  it 'returns temp and description at a location at time of arrival', :vcr do
    weather_at_eta = WeatherFacade.get_weather_summary_at_eta(38.8576, 104.9128, 30)

    expect(weather_at_eta.keys.length).to eq(2)
    expect(weather_at_eta[:temperature]).to be_a(float)
    expect(weather_at_eta[:description]).to be_a(String)
  end
end