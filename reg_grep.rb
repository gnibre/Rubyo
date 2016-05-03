


f = File.open("./datafile/postmates.urls")


lines = f.readlines

reg = /postmates.com\/sitemaps\/([\w-]+).xml/

fw = File.open("./datafile/postmate.cities","w+")
lines.each{ |line|

    # puts line

    m  = reg.match(line)
    if m
        puts m[0]
    end

}



lines.scan(m)