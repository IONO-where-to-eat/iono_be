require 'rails_helper'

RSpec.describe YelpService do
  it 'returns restaurant data by latitude and longitude' do
    latitude, longitude = LocationFacade.location

    search = YelpService.get_restaurants(latitude, longitude)

    expect(search).to be_a Hash
    expect(search[:businesses]).to be_an Array
    expect(search[:businesses].count).to eq(20)

    restaurant_data = search[:businesses].first

    expect(restaurant_data).to have_key :name
    expect(restaurant_data[:name]).to be_a String
  end
end