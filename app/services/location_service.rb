class LocationService
  def self.get_location
    response = conn.get('/v1/geocode/ip')
    parse(response)
  end

  def self.conn
    Faraday.new(url: 'https://api.radar.io') do |faraday|
      faraday.headers['Authorization'] = ENV['location_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end
