class LocationFacade
  def self.location
    location = LocationService.get_location
    latitude, longitude = [location[:address][:latitude], location[:address][:longitude]]
  end
end