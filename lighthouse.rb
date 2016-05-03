#lighthouse.rb

# ruby script,   lighthouse points out the way, never land ....


dn = File.dirname(__FILE__)
require dn+'/lib/lhknife'



############   dir   ############ 
DIR_CRAWLMAN = "/Users/yubing/code/goHome/src/cloudvm/crawlman"
DIR_CRAWLER = "/Users/yubing/code/cloudvm/crawlers"
DIR_KAFKA = "/Users/yubing/Downloads/kafka_2.11-0.9.0.0"
DIR_LH = "/Users/yubing/code/RubYo"
DIR_SERVERADMIN = "/Users/yubing/code/cloudvm/server_admin"

DIR_PYTHON_LIB_HOME="/usr/local/lib/python2.7/site-packages"

DIR_PLAY_SCRAPY = "/Users/yubing/code/playground/playscrapy/fscrapyo"

############   host   ############ 
HOST_JENKINS = "voxel@10.0.1.34"
HOST_JENKINS_WEB = "https://build.voxel.com/"

############   cmd   ############ 
CMD_CRAWLMAN = "./crawlman -config config.json"
CMD_CRAWLMAN_BROWSE = "open http://localhost:8080/jobs.html"
CMD_CRAWLER = "./bin/run_spiders.py"

CMD_START_ZOOKEEPER = "bin/zookeeper-server-start.sh config/zookeeper.properties"
CMD_START_KAFKA = "bin/kafka-server-start.sh config/server.properties "


CMD_LH_ITSELF = "subl "+DIR_LH

############   applescript   ############ 
AS_CMD_NEW_W = 'tell application "System Events" to tell process "Terminal" to keystroke "n" using command down '
AS_CMD_NEW_T = 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down '

# generate apple script, to run in terminal
def asc shcmd
	return 'tell application "Terminal" to do script "'+shcmd+'" in selected tab of the front window'
end

def ask content
	return 'tell application "System Events" to tell process "Terminal" to keystroke "'+content+'"'
end


######################################         CRAWLMAN,  CRAWLER         ######################################
# newt; cd ; browser;  run crawlman
CMD_PREPARE_CRAWLMAN = [
	AS_CMD_NEW_T,
	asc("cd "+DIR_CRAWLMAN),
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
CMD_PREPARE_CRAWL = CMD_PREPARE_CRAWLCOMBO = CMD_PREPARE_CRAWLER+["delay 3"]+CMD_PREPARE_CRAWLMAN


######################################        KAFKA           ######################################
# new window , run zookeeper;   new tab,  run kafka.
CMD_KAFKA_COMBO = [
	AS_CMD_NEW_W,
	asc("cd "+DIR_KAFKA),
	asc(CMD_START_ZOOKEEPER),
	AS_CMD_NEW_T,
	"delay 1",
	asc(CMD_START_KAFKA)
]


##
CMD_JENKINS = [
	AS_CMD_NEW_T,
	asc("open "+HOST_JENKINS_WEB),
	"delay 1",
	asc("ssh "+HOST_JENKINS),
]

LH_CMD = [
	asc("cd "+DIR_LH),
	asc("subl #{DIR_LH}")
]

PLAYSCRAPY_CMD = [
	asc("cd "+DIR_PLAY_SCRAPY),
	asc("subl #{DIR_PLAY_SCRAPY}")
]

PYTHON_LIB_CMD = [
	asc("cd "+DIR_PYTHON_LIB_HOME),
	# asc("subl #{DIR_PYTHON_LIB_HOME}")
]


#  apple script  menu;  items need apple script to run.
ASMENU = {
	crawlman: CMD_PREPARE_CRAWLMAN,
	crawler:CMD_PREPARE_CRAWLER,
	crawl: CMD_PREPARE_CRAWL,
	crawlcombo:CMD_PREPARE_CRAWLCOMBO,
	kafka:CMD_KAFKA_COMBO,
	jenkins:CMD_JENKINS,
	lh:LH_CMD,
	play_scrapy:PLAYSCRAPY_CMD,
	scrapy:PLAYSCRAPY_CMD,
	pythonlib:PYTHON_LIB_CMD,
}

# SH script with this menu.
SHMENU = {
	# lh: [
	# 	"cd "+DIR_LH,
	# 	"subl "+DIR_LH
	# 	],
	# play_scrapy:[
	# 	"cd #{DIR_PLAY_SCRAPY}",
	# 	# "subl #{DIR_PLAY_SCRAPY}"
	# 	],
}



################## 		Functions 		 #################

def fun_deploy 
	puts " ================= [crawler] ================="
	puts " ***   server admin: "
	puts "./bin/cvm-server.rb update --role vxl_crawler "
	puts ""
	puts " ***   digital ocean"
	puts "knife ssh 'role:vxl_crawler_do' 'sudo chef-client' -a ipaddress --no-host-key-verify"
	puts "restart"
	puts "knife ssh 'role:vxl_crawler' 'sudo /etc/init.d/vxl_crawler restart' -a ec2.local_ipv4"
	puts "knife ssh 'role:vxl_crawler_do' 'sudo /etc/init.d/vxl_crawler restart' -a ipaddress"

	deploy_prepare_cmd_list = [
		# ask("really"),
		# ask("echo "+" knife ssh ''role:vxl_crawler_do'' ''sudo chef-client'' -a ipaddress --no-host-key-verify "),
		AS_CMD_NEW_T,
		"delay 1",
		asc("cd "+DIR_SERVERADMIN),
		ask("./bin/cvm-server.rb update --role vxl_crawler "),
	]

	do_osascript(deploy_prepare_cmd_list)

end


def lh_knife
	# role:
	# vxl_crawler
	# role:vxl_crawler_do
	res_iplist = lhknifef(ARGV[1])

	puts " also ssh, "

	cmds_combo = [
		AS_CMD_NEW_T,
		asc("ssh "+res_iplist[0]),
	]

	do_osascript cmds_combo

end


FUNC_MENU = {
	deploy: method(:fun_deploy),
	knife:method(:lh_knife),
}

def showmenu
	puts "========  MENU  ======== "
	ASMENU.each{ |k,v|
		puts k
		# puts v
	}
	SHMENU.each{ |k,v|
		puts k
		# puts v
	}

	FUNC_MENU.each{ |k,v|
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

def do_shscript sh_cmd_list
	puts " ========================>   run sh script list"
	puts " #{sh_cmd_list}"

	sh_cmd_list.each{ |cmd|
		puts cmd
		`#{cmd}`
		puts "done"
	}

	Dir.chdir "/Users/yubing/code/playground"
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

if ASMENU.has_key? item
	do_osascript(ASMENU[item])
elsif SHMENU.has_key? item
	do_shscript(SHMENU[item])
elsif FUNC_MENU.has_key? item
	FUNC_MENU[item].call
else	
	puts " ITEM NOT FOUND :   #{item}"
	showmenu
end




