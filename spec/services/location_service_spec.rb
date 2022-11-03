require 'rails_helper'

RSpec.describe LocationService do
    it "returns location data" do
        search = LocationService.get_location

        expect(search).to be_a Hash
        expect(search[:address]).to be_a Hash
        expect(search[:address]).to have_key :postalCode
        expect(search[:address][:postalCode]).to be_a String
        expect(search[:address]).to have_key :latitude
        expect(search[:address][:latitude]).to be_a Float
        expect(search[:address]).to have_key :longitude
        expect(search[:address][:longitude]).to be_a Float
    end
end