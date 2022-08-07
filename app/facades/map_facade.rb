class MapFacade 

  def self.get_latitude_longitude(location)
    map_json = MapService.get_latitude_longitude(location)
    lat_lng = {
      latitude: map_json[:results][0][:locations][0][:latLng][:lat],
      longitude: map_json[:results][0][:locations][0][:latLng][:lng]
    }
  end
end