require 'faraday'
require 'json'

class YelpService
  def self.get_restaurants(latitude, longitude, radius:, open_now:, transactions:, price:)
    require 'pry'; binding.pry
    response = self.conn.get("/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}")
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
