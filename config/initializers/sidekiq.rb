Sidekiq.configure_server do |config|
  # config.redis = { url: 'redis://localhost:6379/0' }
  config.redis = { url: 'redis://:p90fd351bd7dbe2adbbcd52aea166792e3de0a3a31c47978f96b820dbdf80a659@ec2-52-44-127-226.compute-1.amazonaws.com:23579' }
end

Sidekiq.configure_client do |config|
  # config.redis = { url: 'redis://localhost:6379/0' }
  config.redis = { url: 'redis://:p90fd351bd7dbe2adbbcd52aea166792e3de0a3a31c47978f96b820dbdf80a659@ec2-52-44-127-226.compute-1.amazonaws.com:23579' }
end