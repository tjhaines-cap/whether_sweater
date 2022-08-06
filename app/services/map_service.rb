class MapService

  def self.get_latitude_longitude(location)
    response = connection.get("/geocoding/v1/address?location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "http://www.mapquestapi.com") do |f|
      f.params['api_key'] = ENV['map_api_key']
    end
  end
end