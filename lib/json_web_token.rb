# frozen_string_literal: true

class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = Rails.application.secret_key_base

  def self.encode(payload, exp = 1.week.from_now)
    # set expiry to one week from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    payload = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new payload
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
