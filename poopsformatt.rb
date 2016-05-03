




s = ":poop:"

#perline
MAX = 30

require 'time'
R = Random.new(Time.now.to_i)

def regularpoops
	p = "./datafile/rpoops"
	f = File.open(p,"w+")
	for i in 1..MAX
		line = ""
		for j in 1..i
			line<<s
		end
		line<<"\n"
		f.write(line)
	end

	#f.flush
	f.close

	`open #{p}`
end



def bpoops
	p = "./datafile/bpoops"
	f = File.open(p,"w+")
	ln = 22
	for i in 1..ln
		line = ""
		for j in 1..30
			line<<ranp()
		end
		line<<"\n"
		f.write(line)
	end

	f.close

	`open #{p}`
end


def ranp
	v = R.rand(100)
	
	case v
	when 1..1
		s=":disappointed:"
	when 4..30
		s=" "
		for j in 1..v/10
			s<<" "
		end
	else
		s = ":poop:"
	end
	return s
end


# beautiful poops
bpoops




