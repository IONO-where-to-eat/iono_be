class Api::V1::UsersController < ApplicationController
  def create
    binding.pry
    user = User.find_or_create_by(email: user_params[:email])
    user.update(user_params)
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :token, :google_id)
  end
end