# frozen_string_literal: true

# class for authentication with jwt
class JsonWebToken
  SECRET_KEY = Rails.application.credentials.key_jwt

  def self.encode(payload, exp = 2.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new(decoded)
  end
end
