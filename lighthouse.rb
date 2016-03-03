#lighthouse.rb

# ruby script,   lighthouse points out the way, never land ....






############   dir   ############ 
DIR_CRAWLMAN = "/Users/yubing/code/goHome/src/cloudvm/crawlman"
DIR_CRAWLER = "/Users/yubing/code/cloudvm/crawlers"
DIR_KAFKA = "/Users/yubing/Downloads/kafka_2.11-0.9.0.0"

############   cmd   ############ 
CMD_CRAWLMAN = "./crawlman -config config.json"
CMD_CRAWLMAN_BROWSE = "open http://localhost:8080/jobs.html"
CMD_CRAWLER = "./bin/run_spiders.py"

CMD_START_ZOOKEEPER = "bin/zookeeper-server-start.sh config/zookeeper.properties"
CMD_START_KAFKA = "bin/kafka-server-start.sh config/server.properties "

############   applescript   ############ 
AS_CMD_NEW_W = 'tell application "System Events" to tell process "Terminal" to keystroke "n" using command down '
AS_CMD_NEW_T = 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down '

# generate apple script, to run in terminal
def asc shcmd
	return 'tell application "Terminal" to do script "'+shcmd+'" in selected tab of the front window'
end



######################################         CRAWLMAN,  CRAWLER         ######################################
# newt; cd ; browser;  run crawlman
CMD_PREPARE_CRAWLMAN = [
	AS_CMD_NEW_T,
	asc("cd "+DIR_CRAWLMAN),
	asc(CMD_CRAWLMAN_BROWSE),
	asc(CMD_CRAWLMAN_BROWSE),
	asc(CMD_CRAWLMAN)
]

# newt; cd ; run crawler ; run extra tab
CMD_PREPARE_CRAWLER = [
	AS_CMD_NEW_T,
	asc("cd "+DIR_CRAWLER),
	asc(CMD_CRAWLER),
	AS_CMD_NEW_T
]

# crwal; crawl combo  = crawlman+crawler
# 1 prepare crawlman,  2 prepare crawler,  3 open one more tab of crawler for 'ag' etc.
CMD_PREPARE_CRAWL = CMD_PREPARE_CRAWLCOMBO = CMD_PREPARE_CRAWLMAN+["delay 1"]+CMD_PREPARE_CRAWLER


######################################        KAFKA           ######################################
# new window , run zookeeper;   new tab,  run kafka.
CMD_KAFKA_COMBO = [
	AS_CMD_NEW_W,
	asc("cd "+DIR_KAFKA),
	asc(CMD_START_ZOOKEEPER),
	AS_CMD_NEW_T,
	asc(CMD_START_KAFKA)
]



MENU = {
	crawlman: CMD_PREPARE_CRAWLMAN,
	crawler:CMD_PREPARE_CRAWLER,
	crawl: CMD_PREPARE_CRAWL,
	crawlcombo:CMD_PREPARE_CRAWLCOMBO,
	kafka:CMD_KAFKA_COMBO,
}
def showmenu
	puts "========  MENU  ======== "
	MENU.each{ |k,v|
		puts k
		# puts v
	}
	puts " "
end


def array_cmd_to_s cmdarray
	str = ""
	cmdarray.each{|c|
		str<<c
		str<<"\n"
	}
	return str
end


def do_osascript as_cmd_list
	puts " ========================>   run apple script "
	puts array_cmd_to_s(as_cmd_list)
	puts " "
	`osascript -e '#{array_cmd_to_s(as_cmd_list)}'`
end

# `osascript -e 'tell app "Terminal"
#   do script "#{cmd}"
# end tell'`
#  osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
######################################        ***********   MAIN   ************           ######################################

if ARGV[0].nil?
	 showmenu
	 exit 1
end

item =  ARGV[0].to_sym

if MENU.has_key? item
	do_osascript(MENU[item])
else
	puts " ITEM NOT FOUND :   #{item}"
	showmenu
end




