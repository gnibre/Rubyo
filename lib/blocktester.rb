







# true, blocked,
# false, not
# -1, error running. false
def yelp_blocked? ip

    curl_res = `ssh #{ip} 'curl http://www.yelp.com/biz/vip-oriental-santa-clara'`    
    index = curl_res.index("VIP Oriental")
    if index.nil?
        puts "================================>   #{ip}"
        puts "#{curl_res}"
        return true
    end
    return false;
end



def google_blocked? ip

    #<TITLE>302 Moved</TITLE></HEAD><BODY>
    #<H1>302 Moved</H1>
    #The document has moved
    #<A HREF="https://ipv4.google.com/sorry/IndexRedirect?continue=https://play.google.com/store/apps/details%3Fid%3Dcom.king.candycrushjellysaga&amp;q=CGMSBKLzm4UYjPnfuAUiGQDxp4NLm_TBxl4oudiZiPhkcfuhu3ukCIA">here</A>.

    curl_res = `ssh #{ip} 'curl https://play.google.com/store/apps/details?id=com.king.candycrushjellysaga'`
    index = curl_res.index("Candy Crush Jelly Saga")
    if index.nil?
        puts "================================>   #{ip}"
        puts "#{curl_res}"
        return true
    end
    return false
end


