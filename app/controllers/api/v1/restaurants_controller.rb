class Api::V1::RestaurantsController < ApplicationController
  def index
    binding.pry
    latitude, longitude = LocationFacade.location
    render json: YelpService.get_restaurants(latitude, longitude, radius: params[:radius], open_now: params[:open_now], transactions: params[:transactions], price: params[:price])
  end
end