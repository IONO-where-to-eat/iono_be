require 'faraday'
require 'json'

class YelpService
  def self.get_restaurants(latitude, longitude, filter_params = nil)
    # binding.pry
    filter_params = filter_params.select {|key,value| !value.nil? }
    response = self.conn.get("/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}", params = filter_params)
    # binding.pry
    parse(response)
  end

  private

  def self.conn
    Faraday.new('https://api.yelp.com') do |faraday|
      faraday.params['categories'] = 'restaurants'
      faraday.headers['Authorization'] = ENV['yelp_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
