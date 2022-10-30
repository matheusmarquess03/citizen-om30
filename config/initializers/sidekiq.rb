Sidekiq.configure_server do |config|
  config.redis = { password: 'Redis2019!' }
end

Sidekiq.configure_client do |config|
  config.redis = { password: 'Redis2019!' }
end