REDIS_CONN = proc do
  host =     ENV['REDIS_HOST']
  port =     ENV['REDIS_PORT']

  redis_ready = host.present? and port.present?

  redis_url = if redis_ready
    "redis://#{host}:#{port}/"
  else
    "redis://localhost:6379/0"
  end

  r = Redis.new(url: redis_url)
  Redis::Namespace.new("sidekiq", redis: r)
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/0') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/0') }
end