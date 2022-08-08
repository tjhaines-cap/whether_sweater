class YelpService 

  def self.get_restaurant(location, cuisine)
    response = connection.get("/v3/businesses/search?location=#{location}&categories=#{cuisine}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "https://api.yelp.com", headers: {Authorization: "Bearer #{ENV['yelp_api_key']}"})
  end
end