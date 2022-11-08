class Api::V1::RestaurantsController < ApplicationController
  def index
    if !params[:radius].nil?
      params[:radius] = params[:radius].to_i * 1609
    end

    filter_params = {radius: (params[:radius]), open_now: params[:open_now], price: params[:price]}
    latitude, longitude = LocationFacade.location
    render json: YelpService.get_restaurants(latitude, longitude, filter_params)
  end
end
