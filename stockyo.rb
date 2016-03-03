

puts "go stock yo"
puts "arg1:   #{ARGV} "
stockname = ARGV[0]

if stockname.nil?
	puts " nothing to do "
	return
end

urls = Array.new  

thestreet_url = "http://www.thestreet.com/quote/#{stockname}.html?omorig=header"
urls.push(thestreet_url)

bloomberg_url = "http://www.bloomberg.com/quote/#{stockname}:US"
# urls.push(bloomberg_url)

nasdaq_url = "http://www.nasdaq.com/symbol/#{stockname}"
urls.push(nasdaq_url)


dumbassyahoo_url="http://finance.yahoo.com/q?s=#{stockname}"
urls.push(dumbassyahoo_url)


marketbeat_url = "http://www.marketbeat.com/stocks/NYSE/#{stockname}"
urls.push(marketbeat_url)


google_realtime_url = "https://www.google.com/?#q=#{stockname}%20stock"
urls.push(google_realtime_url)

urls.each { |url|
	puts " open   #{url}"
	`open #{url}`
}














