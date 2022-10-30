Twilio.configure do |config|
  config.account_sid = Myapp::Application.credentials.twilio_account_sid
  config.auth_token = Myapp::Application.credentials.twilio_auth_token
end