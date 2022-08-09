class MapFacade 

  def self.get_latitude_longitude(location)
    map_json = MapService.get_latitude_longitude(location)
    lat_lng = {
      latitude: map_json[:results][0][:locations][0][:latLng][:lat],
      longitude: map_json[:results][0][:locations][0][:latLng][:lng]
    }
  end

  def self.get_travel_time(start_point, end_point)
    route_json = MapService.get_route(start_point, end_point)
    if route_json[:info][:statuscode] == 402
      return "impossible"
    else
      time = route_json[:route][:legs][0][:time]
      minutes = time / 60
      hours = minutes / 60
      remaining_minutes = minutes % 60
      travel_time = "#{hours} hours, #{remaining_minutes} minutes"
    end
  end
end