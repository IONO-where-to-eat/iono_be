require 'rails_helper'

RSpec.describe 'Restaurant API request from FE' do
  it 'sends list of restaurants' do
    
    allow(LocationFacade).to receive(:location).and_return([39.37221145629883, -104.85608673095703])
    get api_v1_restaurants_path

    restaurants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(restaurants).to be_a Hash
    expect(restaurants[:businesses]).to be_an Array
    expect(restaurants[:businesses].count).to eq(20)
  end
end