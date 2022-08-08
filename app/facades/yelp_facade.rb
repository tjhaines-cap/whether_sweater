class YelpFacade

  def self.get_restaurant(location, cuisine)
    json = YelpService.get_restaurant(location, cuisine)
    restaurant_data = json[:businesses][0]
   
    restaurant = {
      destination_city: "#{restaurant_data[:location][:city]}, #{restaurant_data[:location][:state]}",
      restaurant: {
      name: restaurant_data[:name],
      address: restaurant_data[:location][:display_address].join(", ")
      }
    }
  end
end