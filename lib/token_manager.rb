
module TokenMgr

  def self.encode(sub)
    jwt_secret = Rails.application.credentials.jwt_secret

    payload = {
      iss: "http://localhost:3001",
      sub: sub,
      exp: 4.hours.from_now.to_i,
      iat: Time.now.to_i
    }

    JWT.encode(payload, jwt_secret, 'HS256')
  end

  def self.decode(token)
    jwt_secret = Rails.application.credentials.jwt_secret

    options = {
      iss: "http://localhost:3001",
      verify_iss: true,
      verify_iat: true,
      leeway: 30,
      algorithm: 'HS256'
    }

    JWT.decode(token, jwt_secret, true, options)
  end


end
