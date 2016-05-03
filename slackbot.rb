
require 'net/http'

puts " go bot yo"


def rand_win
    r = rand(10)
    return " win 11:"+r.to_s
end

cheaterkey = 'xoxb-34923997762-Lm8fuVTbXzhllgz5gkPIckNe'

helperkey = "xoxb-34908620966-LJjjHJZRRK2ADbZELoC6KVnN"


uri = URI("https://slack.com/api/chat.postMessage")




res = Net::HTTP.post_form(uri, 
    'token' => 'xoxb-34923997762-Lm8fuVTbXzhllgz5gkPIckNe',
    'channel' => '#testtesttest1',
    'text' => ' :poop:'+rand_win
)





puts res



