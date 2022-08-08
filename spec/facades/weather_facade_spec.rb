require 'rails_helper' 

RSpec.describe WeatherFacade do

  describe '#get_weather' do
    it 'returns weather objects from get weather' do
      weather_data = JSON.parse(File.read("spec/fixtures/weather.json"), symbolize_names: true)
      weather = Weather.new(weather_data)

      expect(weather).to be_a(Weather)
      expect(weather.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather) 
    end
  end

  describe '#get_weather_summary' do
    it 'returns current weather summary and temperature for a location', :vcr do
      weather_summary = WeatherFacade.get_weather_summary('denver,co')

      expect(weather_summary.keys.length).to eq(2)
      expect(weather_summary.keys).to include(:summary, :temperature)
    end
  end
end