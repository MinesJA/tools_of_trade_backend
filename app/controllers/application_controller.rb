class ApplicationController < ActionController::API

  def curr_user
    puts "CURRENT_USER"
    token = request.headers['Authorization']
    payload = TokenMgr.decode(token)[0]

    @current_user ||= User.find_by(id: payload["user_id"])
  end

  def logged_in?
    puts "LOGGED_IN?"
    current_user != nil
  end

  def authenticate_user!
    puts "AUTHENTICATE_USER!"
    head :unauthorized unless logged_in?
  end

end
