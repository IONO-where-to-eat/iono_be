require 'rails_helper'

RSpec.describe 'User Request APIs' do
  it 'creates a user' do
    user_params = {
      email: Faker::Omniauth.google[:info][:email],
      token: Faker::Omniauth.google[:credentials][:token], 
      google_id: Faker::Omniauth.google[:uid] 
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

    created_user = User.last

    expect(response).to be_successful
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.token).to eq(user_params[:token])
    expect(created_user.google_id).to eq(user_params[:google_id])
  end
end