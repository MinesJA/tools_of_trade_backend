class Api::V1::UsersController < ApplicationController



  def show
    render json: @current_user
  end



  def login
    github_client = Rails.application.credentials.github[:client_id]
    github_secret = Rails.application.credentials.github[:client_secret]
    code = params[:code]

    # token_headers = {
    #   "Accept": "application/json"
    # }
    #
    # payload = {
    #   code: code,
    #   client_id: github_client,
    #   client_secret: github_secret
    # }
    #
    # token_response = RestClient.post("https://github.com/login/oauth/access_token", payload, token_headers)
    # json = JSON.parse(token_response)
    #
    # access_token = json["access_token"]


    api_headers = {
      Authorization: access_token
    }

    api_response = RestClient.get("https://api.github.com/user?access_token=#{access_token}")
    json = JSON.parse(api_response)

    login = json["login"]
    name = json["name"]
    avatar_url = json["avatar_url"]


    user = User.where(login: login).first_or_create!(
      name: name,
      avatar_url: avatar_url
    )

    jwt_token = JWT.encode({"user_id": user.id}, Rails.application.credentials.jwt_secret, 'HS256')


    redirect_to "http://localhost:3001?token=#{jwt_token}"
  end


  # def authenticate_user
  #   User.
  #
  # end

end
