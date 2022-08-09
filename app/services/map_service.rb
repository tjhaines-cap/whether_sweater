class MapService

  def self.get_latitude_longitude(location)
    response = connection.get("/geocoding/v1/address?key=#{ENV['map_api_key']}&location=#{location}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(start_point, end_point)
    response = connection.get("/directions/v2/route?key=#{ENV['map_api_key']}&from=#{start_point}&to=#{end_point}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "http://www.mapquestapi.com")
  end
end