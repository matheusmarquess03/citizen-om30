Twilio.configure do |config|
  config.account_sid = Om30::Application.credentials.twilio_account_sid
  config.auth_token = Om30::Application.credentials.twilio_auth_token
end