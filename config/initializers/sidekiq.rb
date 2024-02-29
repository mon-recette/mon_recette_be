# Sidekiq.configure_server do |config|
#   # config.redis = { url: 'redis://localhost:6379/0' }
#   config.redis = { url: 'redis://:p90fd351bd7dbe2adbbcd52aea166792e3de0a3a31c47978f96b820dbdf80a659@ec2-52-44-127-226.compute-1.amazonaws.com:23579' }
# end

# Sidekiq.configure_client do |config|
#   # config.redis = { url: 'redis://localhost:6379/0' }
#   config.redis = { url: 'redis://:p90fd351bd7dbe2adbbcd52aea166792e3de0a3a31c47978f96b820dbdf80a659@ec2-52-44-127-226.compute-1.amazonaws.com:23579' }
# end

SIDEKIQ_REDIS_CONFIGURATION = {
  url: ENV.fetch(ENV.fetch("REDIS_PROVIDER", "REDIS_URL"), nil), # use REDIS_PROVIDER for Redis environment variable name, defaulting to REDIS_URL 
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }, # we must trust Heroku and AWS here
}

Sidekiq.configure_server do |config|
  config.redis = SIDEKIQ_REDIS_CONFIGURATION
end

Sidekiq.configure_client do |config|
  config.redis = SIDEKIQ_REDIS_CONFIGURATION
end