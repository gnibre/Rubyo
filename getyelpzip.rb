


f = File.open("/Users/yubing/Downloads/cmd.json.txt")

	lines = f.readlines
	asdf = 123
fw = File.open("./datafile/yelpzip","w")
lines.each { |line|

    #spider":"yelp_zipcode","url":"20045"},
    puts line
    m = /[\d]+/.match(line)
    if m
        fw.write(m[0]+"\n")
    end
}


fw.close

