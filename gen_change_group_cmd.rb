


require 'net/http'
require 'json'

uri = URI('http://crawlman.voxel.com:8082/crawlers')
crawlers_str = Net::HTTP.get(uri)

# puts crawlers_str


crawlers_json = JSON.parse(crawlers_str)

puts "get crawlers json"
#puts crawlers_json


crawlers = crawlers_json['crawlers']

# add group id.



ct = 0

crawlers.each { |c|
    # puts c['id']
    g = c['groups']
    meta = c['metadata']


    

    meta_j = JSON.parse(meta)
    if meta_j['instance_id']
        # puts " have instance id ,  #{meta_j['instance_id']}"

        # find instance from digit ocean.   do-crawler-20 ;  for index < 30; add group do-20 to it.
        instance_id = meta_j['instance_id']


        if /do-crawler-[\d]+/.match(instance_id)

            index = /[\d]+/.match(instance_id)[0]
            # puts "index get #{index}"
            if index.to_i <50
                puts "=======================================> do it  #{index}    :      instance_id"
                ct+=1

                if g.length == 1 && g[0]=='default'
                    # previous group is default ["default"]
                    # add new group to it. 

                    add_group_name = "do-"+index

                    crawlerid = c['id']
                    puts " intance #{instance_id}    with be added group  #{add_group_name}      ; #{crawlerid}"


                    


                    cmd = "curl -XPUT 'http://crawlman.voxel.com:8082/crawlers/#{crawlerid}?add_group=#{add_group_name}'"



                    puts cmd

                puts " commit out ."

                  #  `#{cmd}`

                else 
                    puts g
                end




            end
        end
    end

    
}

puts " after, find total instance : #{ct}"


