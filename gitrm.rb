


puts " git rm  list"
f = File.open("datafile/gitrm")
lines = f.readlines

out = ""
lines.each { |line|
	puts line
	rmcmd = line.split(" ")[1]
	# puts glext
	puts "=>  #{rmcmd}"
	out+="git rm #{rmcmd}\n"




	# if line.include?" "

	# if line.include?"\""
	# 	glext = line.split("\"")[1]
	# 	puts " #{line} =>  #{glext}"
	# 	out+=glext+", "
	# end
}

puts out
