class Authenticator


  def github(code)
    access_token_resp = fetch_github_access_token(code)
    puts "Authenticator, github method 1, access_token_resp:#{access_token_resp}"
    user_info_resp = fetch_github_user_info(access_token_resp['access_token'])
    puts "Authenticator, github method 2, user_info_resp:#{access_token_resp}"

    {
      login: user_info_resp['login'],
      name: user_info_resp['name'],
      avatar_url: user_info_resp['avatar_url']
    }
  end

  private

  def fetch_github_access_token(code)
    access_token_url = Rails.application.credentials.github[:access_token_url]
    puts "Access_token_url: #{access_token_url}"
    github_client = Rails.application.credentials.github[:client_id]
    puts "Github_client: #{github_client}"
    github_secret = Rails.application.credentials.github[:client_secret]
    puts "Github_secret: #{github_secret}"


    response = RestClient.post(access_token_url, {
      code: code,
      client_id: github_client,
      client_secret: github_secret
      }, {"Accept": "application/json"})

    JSON.parse(response)
  end

  def fetch_github_user_info(access_token)
    user_url = Rails.application.credentials.github[:user_url]

    response = RestClient.get("#{user_url}?access_token=#{access_token}")
    JSON.parse(response)
  end


end
