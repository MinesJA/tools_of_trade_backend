
module TokenMgr

  def self.encode(user)
    puts "TRYING TO ENCODE"
    
    jwt_secret = Rails.application.credentials.jwt_secret

    JWT.encode({user_id: user.id}, jwt_secret, 'HS256')
  end

  def self.decode(token)
    puts "TRYING TO DECODE"
    jwt_secret = Rails.application.credentials.jwt_secret
    JWT.decode(token, jwt_secret, true)
  end


end
