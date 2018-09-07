class Api::V1::AuthenticationController < ApplicationController

  def github
    authenticator = Authenticator.new
    user_info = authenticator.github(params[:code])

    login = user_info[:login]
    name = user_info[:name]
    avatar_url = user_info[:avatar_url]

    user = User.where(login: login).first_or_create!(
      name: name,
      avatar_url: avatar_url
    )

    token = TokenMgr.encode(user)

    redirect_to "https://tools-of-trade.herokuapp.com?token=#{token}"
  end

  def show
    render json: curr_user, include: ['tools', 'tools.tags']
  end

end
