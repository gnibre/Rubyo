
# import string
# import str


puts "start jobs"


puts "start"




f = File.open("datafile/delejobs")

puts f

lines = f.readlines


out = ""
lines.each { |line|
	#"id": "697229a1-c3c9-11e5-a36b-0a3e2d5f6d89",
	
	if line.include? "\"id"
		# puts line
		res = line.split("\"")
		puts res[3]

		if res[3] == 'd0218056-c3c6-11e5-a2d2-0a3e2d5f6d89'
			puts " xxxxxxxxx find d0218056-c3c6-11e5-a2d2-0a3e2d5f6d89"
			next
		end

		if res[3] == '295cd127-bbc4-11e5-a29a-0a3e2d5f6d89'
			puts " xxxxxxxxx find 295cd127-bbc4-11e5-a29a-0a3e2d5f6d89"
			next
		end

		# puts " gonna do it "
		puts " will do 'http://crawlman.voxel.com:8082/jobs/#{res[3]}' "
		`curl -XDELETE 'http://crawlman.voxel.com:8082/jobs/#{res[3]}'`

		# out+=res[3]
	end

	# glext = line.split("\"")[1]
	# puts " #{line} =>  #{glext}"
	# out+=glext+", "
}

puts " outoutout "

puts out





