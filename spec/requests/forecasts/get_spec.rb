require 'rails_helper'

RSpec.describe "Gets" do

  describe "GET /forecasts" do
    it "returns forecast informaiton", :vcr do
      get "/api/v1/forecasts?location=denver,co"

      response_hash = JSON.parse(response.body, symbolize_names: true)
      data = response_hash[:data]
      forecast = data[:attributes]
      expect(data.keys).to include(:id, :type, :attributes)
      expect(forecast.keys).to include(:current_weather, :daily_weather, :hourly_weather)
      expect(forecast.keys).to_not include(:minutely, :alerts)
      expect(forecast[:current_weather].keys.length).to eq(10)
      expect(forecast[:current_weather].keys).to include(:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon)
      expect(forecast[:daily_weather].keys.length).to eq(7)
      expect(forecast[:daily_weather].keys).to include(:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon)
      expect(forecast[:hourly_weather].keys.length).to eq(4)
      expect(forecast[:hourly_weather].keys).to include(:time, :temperature, :conditions, :icon)
    end
  end
end