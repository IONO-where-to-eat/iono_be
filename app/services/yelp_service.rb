require 'faraday'
require 'json'

class YelpService
  def self.get_restaurants(latitude, longitude, filter_params = nil)
    if filter_params.nil?
      response = self.conn.get("/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}")
    else
      filter_params = filter_params.select {|key,value| !value.nil? }
      response = self.conn.get("/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}", params = filter_params)
    end
    parse(response)
  end

  private

  def self.conn
    Faraday.new('https://api.yelp.com') do |faraday|
      faraday.params['categories'] = 'restaurants'
      faraday.params['limit'] = '40'
      faraday.headers['Authorization'] = ENV['yelp_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
