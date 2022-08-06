require 'rails_helper' 

RSpec.describ WeatherFacade do

  it 'returns weather objects from get weather' do
    weather = WeatherFacade.get_weather("Manitou Springs, CO")

    expect(weather).to be_a(Weather)
    expect(weather.attributes.keys).to include(:current_weather, :daily_weather, :hourly_weather) 
  end
end