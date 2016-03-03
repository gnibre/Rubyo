require 'sidekiq'

require './skworker.rb'

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379', namespace:'x', size:1 }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379', namespace:'x' }
end



puts Sidekiq::Client.inspect

 Sidekiq::Client.enqueue(LessRetryableWorker)
 LessRetryableWorker.perform_async(99)
