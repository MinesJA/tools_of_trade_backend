class Api::V1::UsersController < ApplicationController
  # Rails.application.credentials.github[:client_id]
  # Rails.application.credentials.github[:client_secret]

  def index
    render json: User.includes(:tools), include: ['tools']
  end


  def show
    @user = User.find(user_params[id])

    render json: user
  end

  def login
    github_client = Rails.application.credentials.github[:client_id]
    github_secret = Rails.application.credentials.github[:client_secret]
    code = params[:code]

    # byebug

    headers = {
      "Accept": "application/json"
    }

    payload = {
      code: code,
      client_id: github_client,
      client_secret: github_secret
    }

    response = RestClient.post("https://github.com/login/oauth/access_token", payload, headers)
    json = JSON.parse(response)

    json["access_token"]


    byebug

  end

end
