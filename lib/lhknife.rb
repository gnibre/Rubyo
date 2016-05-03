require 'uri'


def lhknifef(cmd)

    puts " lh knife search #{cmd} "

    res = `knife search #{cmd}`
    puts res


    ips = `knife search #{cmd} -a ipaddress`

    serverlist = ips.scan(/ipaddress: [\w\d\.]+/)

    c = 0
    iplist = []
    serverlist.each{ | line |
        ip = line.scan(/\d[\w\d\.]+/)[0]
        c+=1
        puts " #{c} ==>    ssh #{ip}"
        iplist.push(ip)
    }
    return iplist
    
end





# def yelp_test()

#     iplist = lhknifef("vxl_crawler")  #cassandra

#     puts " --> "

#     puts iplist

#     ct = 0

#     # if blocked, yelp page will be like 
#             #     <div id="content">
#             #     <h2>Sorry, you're not allowed to access this page.</h2>
#             #     <p>Your IP address is: 159.203.238.21</p>
#             #     <p>Please retry your request and <a href="mailto:feedback+unavailable@yelp.com?subject=IP%20Block%20Message%3A%20159.203.238.21">contact Yelp</a> if you continue experiencing issues.</p>
#             # </div>
            
#     iplist.each { |ip|
#         curl_res = `ssh #{ip} 'curl http://www.yelp.com/biz/vip-oriental-santa-clara'`    
#         index = curl_res.index("which is chicken wings")
#         # curl_res = `ssh #{ip} 'curl https://play.google.com/store/apps/details?id=com.king.candycrushjellysaga'`    
#         # index = curl_res.index("302 Moved")
#         puts "cw index  #{index}"
#         if index.nil?
#             puts " seems good "
#         else
#             ct+=1
#             puts "#{ct}    xxxxxxxxxxxxxxxx   #{ip}"
#         end
#     }


# end



# puts " wtf ? will run test?"


# yelp_test