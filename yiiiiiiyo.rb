
require './lib/emailer'


puts "yiiiiyo"

# argv  v0 : 0 for dont' crawl,  other wise, crawl.

if ARGV[0] == "0"
	@docrawl = false
else
	@docrawl = true
end


t = Time.now

# EST timezone, new york
t_est = t.localtime("-05:00")

# format time  #02/19/2016 12:30PM  PST
f_time= t.strftime("%m/%d/%Y %I:%M%p EST")
t_fn = t.strftime("%m-%d-%Y_%I%P")
f_time_short = t.strftime(" %m/%d")

fn = "yiyiyiyiyi_"+t_fn+".html"

filepath="dailyHtml/"+fn

puts f_time

@scrpay_path = "/Users/yubing/code/playground/playscrapy/fscrapyo/"

f = File.open(filepath,"w+")

def readfile fpath
	f = File.open(fpath)
	# lines = f.readlines
	s = f.read
	puts giffname
end




def strip_percent_value price_percent_string
	# (2.05%) => 2.05
	# (+2.05%) => 2.05
	#   (-3.31)  => -3.31
	r = /[\+\-]*\d+.\d+/
	res = r.match(price_percent_string)
	return res[0].to_f
end


def generate_china_index stock_code
	f = File.open(@scrpay_path+"res/"+stock_code)
	lines = f.readlines
	# 1 price
	# 2 change start with (+ or - )
	# 3 change percent
	puts lines

	if stock_code == "000001"
		name = "上证 (SHA:000001)"
		links = '<a href="http://gu.qq.com/sh000001">  上证指数链接 </a>'
	elsif stock_code == "399001"
		name = "深证 (SHE:399001)"
		links = '<a href="http://gu.qq.com/sz399001">   深证成指 </a>'
	else
		name = "NYSE:"+stock_code
		links = "
		<a href='https://www.google.com/finance?q=NYSE:#{stock_code}'> google_finance </a>
		&nbsp;&nbsp;&nbsp;
		<a href='http://www.marketbeat.com/stocks/NYSE/#{stock_code}'> marketbeat </a>
		&nbsp;&nbsp;&nbsp;
		<a href='http://finance.yahoo.com/q?s=#{stock_code}'> yahoo </a>
		"
	end
	# float, price change percent 
	p_c_p = strip_percent_value lines[2]

	
	if p_c_p < 0 
		color_code =  "color:#FF0000"   # red
	else
		color_code =  "color:#009900"    # green
	end


	if p_c_p < -7
		sugguest = " 😵😵😵😵😵 心好累，感觉不会爱了  😂😂😂😂😂 "
	elsif p_c_p < -5 
		sugguest = " 惨惨惨 跌的好厉害。 小一一，怎么办啊。。。 😂😂😂😂😂😂"
	elsif p_c_p < -3
		sugguest = " 跌了不少 😂😂😂"
	elsif p_c_p < -1 
		sugguest = " 跌了一些 😂😂"
	elsif p_c_p < 0 
		sugguest = " 没赚 😂"
	elsif p_c_p < 1
		sugguest = " 没陪 😀"
	elsif p_c_p < 3
		sugguest = " 赚啦  😀😀"
	elsif p_c_p < 5
		sugguest = " 赚啦不少 😀😀😀"
	else
		sugguest = " 好厉害！ 😂😂😂😂😂😂😂😂 "
	end

	sugguest = "MHO:    "+sugguest


	htmls =  "
	<span style='font-size: 16px'> #{name} </span>
    <br>
    <span style='font-size: 20px'> #{lines[0]} </span>
    <br>
    <span style='#{color_code}'> &nbsp;#{lines[1]}</span>
    <span style='#{color_code}'> &nbsp;#{lines[2]} </span>
    <br>

    <span style='font-size: 14px'> #{sugguest} </span>
    <br>
	#{links}
    <br>
    <br>
	"

	puts htmls

	return htmls
end

puts "trigger scrapy : "

if @docrawl
`cd /Users/yubing/code/playground/playscrapy/fscrapyo; scrapy crawl stockyo`
else
	puts " skip crawl , use crawled data"
end


puts " res file at  <scrpay_path>/res"
# name 000001  ,  399001





htmlPage = 

# page head
IO.read("pages/page.head")+
# all div's ,  start from selected stocks,  
""+
# timestamp 
" #{f_time} <br> <br>"+

# add   sh0001  and  sz  index
generate_china_index("000001")+


generate_china_index("399001")+
"<br><br><br>"+
generate_china_index("BABA")+
generate_china_index("AYI")+
generate_china_index("GE")+
generate_china_index("DATA")+
generate_china_index("NXPI")+
generate_china_index("PHG")+

""+
IO.read("pages/page.tail")



f.write(htmlPage)
f.close


subj = "daily stock report  #{f_time_short}"

msg = ""

Emailer.send_daily_stock_email(fn,subj,msg)

`open #{filepath}`

puts "done."












