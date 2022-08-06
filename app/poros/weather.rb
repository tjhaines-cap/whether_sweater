class Weather

  attr_reader :id, :type, :attributes

  def initialize(data)
    @id = nil
    @type = "forecast"
    @attributes = format_attributes(data)
  end

  private

    def format_attributes(data)
      {
        current_weather: format_current_weather(data[:current]),
        daily_weather: format_daily_weather(data[:daily]),
        hourly_weather: format_hourly_weather(data[:hourly])
      }
    end

    def format_current_weather(current)
      {
        datetime: Time.at(current[:dt]).to_s,
        sunrise: Time.at(current[:sunrise]).to_s,
        sunset: Time.at(current[:sunset]).to_s,
        temperature: current[:temp],
        feels_like: current[:feels_like],
        humidity: current[:humidity],
        uvi: current[:uvi],
        visibility: current[:visibility],
        conditions: current[:weather][0][:description],
        icon: current[:weather][0][:icon]
      }
    end

    def format_daily_weather(daily)
      five_days = daily[0..4]
      five_days.map do |day|
        {
          date: Time.at(day[:dt]).to_s[0..9],
          sunrise: Time.at(day[:sunrise]).to_s,
          sunset: Time.at(day[:sunset]).to_s,
          max_temp: day[:temp][:max],
          min_temp: day[:temp][:min],
          conditions: day[:weather][0][:description],
          icon: day[:weather][0][:icon]
        }
      end
    end

    def format_hourly_weather(hourly)
      eight_hours = hourly[0..7]
      eight_hours.map do |hour|
        {
          time: Time.at(hour[:dt]).to_s[11..18],
          temperature: hour[:temp],
          conditions: hour[:weather][0][:description],
          icon: hour[:weather][0][:icon]
        }
      end
    end
end