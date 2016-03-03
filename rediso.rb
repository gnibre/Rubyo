
puts "-------------------------------- redis "

require 'redis'

r = Redis.new

r.del('foo')

puts

p 'set foo to "bar"'
r['foo'] = 'baraaa'

p 'value of foo'
p r['foo']



r['newnew'] = "toohard:("


p r['newnew']


require 'sidekiq'
require './skworker.rb'

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379', size:1 }
# end

# # Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379', namespace:'x' }
# end



Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379', namespace:'sdkq', size:1 }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379', namespace:'sdkq' }
end



eres=Sidekiq::Client.enqueue(LessRetryableWorker)
puts "enqueue"

puts eres.inspect

# equivalent to:
pres = LessRetryableWorker.perform_async(456)

# pres = LessRetryableWorker.perform_in(1.minutes, 80086)

