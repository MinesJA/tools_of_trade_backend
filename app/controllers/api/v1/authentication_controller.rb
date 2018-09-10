class Api::V1::AuthenticationController < ApplicationController

  def github
    authenticator = Authenticator.new
    puts "Github method, authenticator, params code:#{params[:code]}"
    user_info = authenticator.github(params[:code])
    puts "Github method, user_info:#{user_info}"

    login = user_info[:login]
    name = user_info[:name]
    avatar_url = user_info[:avatar_url]

    user = User.where(login: login).first_or_create!(
      name: name,
      avatar_url: avatar_url
    )

    token = TokenMgr.encode(user)

    # redirect_to "https://tools-of-trade.herokuapp.com?token=#{token}"
    redirect_to "#{Rails.application.credentials[Rails.env.to_sym][:site_url]}?token=#{token}"
  end

  def show
    render json: curr_user, include: ['tools', 'tools.tags']
  end

end
