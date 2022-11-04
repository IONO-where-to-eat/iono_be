class Api::V1::RestaurantsController < ApplicationController
  def index
    latitude, longitude = LocationFacade.location
    render json: YelpService.get_restaurants(latitude, longitude)
  end
end