
require 'net/http'

require 'json'

dn = File.dirname(__FILE__)
require dn+'/lib/blocktester'


cm_uri = URI('http://crawlman.voxel.com:8082/crawlers')


crawlers_list = Net::HTTP.get(cm_uri)
# puts " crawlers list: "
# puts crawlers_list

crawlers_json = JSON.parse(crawlers_list)

@crawlers = crawlers_json["crawlers"]

# puts @crawlers



def report_priv_list
    f_g = File.open("./datafile/crawlman_block_ips_google.txt","r")
    f_y = File.open("./datafile/crawlman_block_yelp_ips.txt","r")

    g_l = f_g.readlines
    y_l = f_y.readlines


    # g_l.each { |g|
    #     # puts " who blocked by google? #{g}"
    #     ip  = g.chop
    #     puts "======>   [#{ip}]"

    #     rt=`curl -XPOST --data "ip=#{ip}&site=google_play&status=block" http://crawlman.voxel.com:8082/blocks/report`
    #     puts rt
    # }


    y_l.each { |y|
        # puts " who blocked by google? #{g}"
        ip  = y.chop
        puts "======>   [#{ip}]"

        rt=`curl -XPOST --data "ip=#{ip}&site=yelp&status=block" http://crawlman.voxel.com:8082/blocks/report`
        puts rt
    }


end



def get_priv_list 
    f_g = File.open("./datafile/crawlman_block_ips_google.txt","r")
    f_y = File.open("./datafile/crawlman_block_yelp_ips.txt","r")

    g_l = f_g.readlines
    y_l = f_y.readlines

    puts g_l
    puts y_l



    # ip  ="159.203.238.53"

    # if g_l.include? (ip+"\n")
    #     puts " yes in  g"
    # end

    # if y_l.include? (ip+"\n")
    #     puts " yes in  y"
    # end


    f_dup = File.open("./datafile/crawlman_dup_newserver.txt","w+")


    @crawlers.each_with_index{ |c,i|
        parse_public_ip(c)
        puts "#{i}   : #{c["version"]}  #{c["metadata"]}   #{c["ip_address"]} ===> #{c["public_ip"]}    "        
        # puts " doing   [#{c["public_ip"]}]    ====> ssh #{c["ssh_ip"]}"

        pub_ip  = c["public_ip"]

        good = false
        if g_l.include? (pub_ip+"\n")
            puts " g xxxx"
        elsif y_l.include? (pub_ip+"\n")
            puts " y xxxx "
        else
            puts " gooood !!!!! "
            good = true
        end

        unless good
            f_dup.write(c["metadata"]+"     ")
            f_dup.write(pub_ip)
            f_dup.write("\n")
        end

        # f_ips.write c["public_ip"]
        # f_ips.write "\n"


    } 
    f_dup.close





end



def list_ips
    puts " ---------------------------------------------"
    
    f_ips = File.open("./datafile/crawlman_ips_new.txt","w+")

    f_google_block_new = File.open("./datafile/crawlman_google_block_new.txt","w+")

    @crawlers.each_with_index{ |c,i|

        parse_public_ip(c)
        puts "#{i}   : #{c["version"]}  #{c["metadata"]}   #{c["ip_address"]} ===> #{c["public_ip"]}    "
        f_ips.write c["public_ip"]
        f_ips.write "\n"


        if google_blocked? c["ssh_ip"]
            f_google_block_new.write(c["public_ip"]+"\n")
            puts " ========== poooooooop , report"

        else
            puts " :) "
        end




    }
    f_google_block_new.close
end


def block_test_google
    puts " ---------------------------------------------"
    
    f_ips = File.open("./datafile/crawlman_ips.txt","w+")
    f_b_ips = File.open("./datafile/crawlman_block_ips.txt","w+")

    total = @crawlers.length
    bc = 0
    v5c = 0

    @crawlers.each_with_index{ |c,i|

        parse_public_ip(c)

        if c["version"] == "5" 
            puts "   ;););););););););)    ignore  v5 "
            v5c+=1
            next
        end


        puts "#{i}   : #{c["version"]}  #{c["metadata"]}   #{c["ip_address"]} ===> #{c["public_ip"]}    "

        # private ip to ssh.
        # public ip to record.
        
        puts " doing   [#{c["public_ip"]}]    ====> ssh #{c["ssh_ip"]}"

        f_ips.write c["public_ip"]
        f_ips.write "\n"

        # if  yelp_blocked? c["ssh_ip"]
        if google_blocked? c["ssh_ip"]
            f_b_ips.write(c["public_ip"]+"\n")

            bc+=1
            puts "#{bc} / #{i}    poooooooop , report"

            # `curl -XPOST --data "ip=#{c["public_ip"]}&site=google_play&status=block" http://localhost:8080/blocks/report`
        else
            puts " :) "
        end


    } 



    puts " toatal :  #{total}"
    puts " blocked  :  #{bc}"
    puts " v5  :  #{v5c}"
    
    f_ips.close
    f_b_ips.close
end

def block_test_yelp
    puts " ---------------------------------------------"
    
    f_ips = File.open("./datafile/crawlman_ips.txt","w+")
    f_b_ips = File.open("./datafile/crawlman_block_yelp_ips.txt","w+")

    total = @crawlers.length
    bc = 0
    v5c = 0
    @crawlers.each_with_index{ |c,i|

        if c["version"] == "5" 
            puts "   ;););););););););)    ignore  v5 "
            v5c+=1
            next
        end


        parse_public_ip(c)
        puts "#{i}   : #{c["version"]}  #{c["metadata"]}   #{c["ip_address"]} ===> #{c["public_ip"]}    "

        # private ip to ssh.
        # public ip to record.
        
        puts " doing   [#{c["public_ip"]}]    ====> ssh #{c["ssh_ip"]}"

        f_ips.write c["public_ip"]
        f_ips.write "\n"

        # if  yelp_blocked? c["ssh_ip"]
        if yelp_blocked? c["ssh_ip"]
            f_b_ips.write(c["public_ip"]+"\n")
            puts " poooooooop , report"
            bc+=1

            `curl -XPOST --data "ip=#{c["public_ip"]}&site=yelp&status=block" http://localhost:8080/blocks/report`
        else
            puts " :) "
        end


    } 

    puts " toatal :  #{total}"
    puts " blocked  :  #{bc}"
    puts " v5  :  #{v5c}"


    f_ips.close
    f_b_ips.close
end




def parse_public_ip(crawler)
    puts crawler["metadata"]
    # puts crawler.class
    ip = crawler["ip_address"]

    # ip from  amazon servers is just ip
    # ip from do servers is with format .
    begin
        ip.gsub!("=>",": ")
        jip  = JSON.parse(ip)
        puts " jip get .  #{jip}"
        unless jip["ip_address"].nil?
            crawler["public_ip"] = jip["ip_address"]

            # digital ocean use public ip to ssh.
            crawler["ssh_ip"] = jip["ip_address"]
            return
        end
    rescue JSON::ParserError => e

    end

    # others use private ip to ssh
    crawler["public_ip"] = ip

    crawler["ssh_ip"] = crawler["private_ip"]
end





def find_block_log
    @crawlers.each_with_index{ |c,i|

        parse_public_ip(c)
        puts "#{i}   : #{c["version"]}  #{c["metadata"]}   #{c["ip_address"]} ===> #{c["public_ip"]}    "

        # private ip to ssh.
        # public ip to record.
        
        puts " doing   [#{c["public_ip"]}]    ===========> ssh #{c["ssh_ip"]}"

        cat_res = `ssh #{c["ssh_ip"]} 'sudo cat /opt/voxel/crawler/shared/log/scrapy.log'`


        pcount = 3;
        cat_res.each_line { |line|
            

            if line.index("block")
                pcount =10
            end

            if pcount>0
                puts line
                pcount -=1
            end
        }

    } 
end


# find_block_log



# list_ips

tip = "45.55.31.247"
tip = "159.203.209.144"



#  gooood !!!!! 
# {"instance_id":"do-crawler-134"}
#  jip get .  {"ip_address"=>"45.55.31.247", "type"=>"public", "netmask"=>"255.255.224.0"}
# 95   : 10  {"instance_id":"do-crawler-134"}   {"ip_address": "45.55.31.247", "type": "public", "netmask": "255.255.224.0"} ===> 45.55.31.247    
#  gooood !!!!! 
# {"instance_id":"do-crawler-143"}
#  jip get .  {"ip_address"=>"159.203.209.144", "type"=>"public", "netmask"=>"255.255.240.0"}
# 96   : 10  {"instance_id":"do-crawler-143"}   {"ip_address": "159.203.209.144", "type": "public", "netmask": "255.255.240.0"} ===> 159.203.209.144    
#  gooood !!!!! 
# {"instance_id":"do-crawler-125"}
#  jip get .  {"ip_address"=>"159.203.209.31", "type"=>"public", "netmask"=>"255.255.240.0"}
# 97   : 10  {"instance_id":"do-crawler-125"}   {"ip_address": "159.203.209.31", "type": "public", "netmask": "255.255.240.0"} ===> 159.203.209.31    
#  gooood !!!!! 
# {"instance_id":"do-crawler-120"}




# puts yelp_blocked?tip


# puts google_blocked? tip
block_test_yelp
# block_test_google
# get_priv_list


# report_priv_list








