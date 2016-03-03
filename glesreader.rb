
puts "start"




# f = File.open("datafile/gles")
f = File.open("datafile/syslib")
# f = File.open("datafile/sysfeature")
# f = File.open("datafile/locale")


puts f

lines = f.readlines


out = ""
lines.each { |line|
	if line.include?"\""
		glext = line.split("\"")[1]
		puts " #{line} =>  #{glext}"
		out+=glext+", "
	end
}

puts " outoutout "

puts out












