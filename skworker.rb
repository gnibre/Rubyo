require 'sidekiq'
class LessRetryableWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5 # Only five retries and then to the Dead Job Queue

  @d = 3

  def perform(count=2)

  	 puts "Job ##{count}: Late night, so tired...   #{@d} ??"

  	 if @d.nil?
  	 @d = 3
  	 end
  	Sidekiq.redis do |conn|
  		puts " sidekiq.redis do "
  		conn["haha#{count}"] = "hehe"
  	end


  	f=File.new("kkk","a+")
  	f.syswrite("doing work #{count} \r\n  ")
  	f.close
  	puts "doing work"

  	@d =@d - 1
  	some = 1/@d
  	puts "res :  #{some}"
  end



  def self.late_night_work
    10.times do |x|
      perform_async(x)
    end
  end



end

