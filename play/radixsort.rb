require 'pathname'


puts " sort file"


dn = File.dirname(__FILE__)
puts dn
f = File.open(dn+"/../datafile/crawlman_ips.txt","r")

lines = f.readlines()

# array.
puts lines.class
len = lines.length
puts len


# puts lines[1]
# puts lines[1][0]
# puts lines[1][1]
# puts lines[1][2]
# puts lines[1][333]
# puts lines[10].class



# 
# puts lines

# puts lines.class

# puts lines


# array
# column to compare
# start, end
def rs( ar, c, s, e )
    unless s<e
        puts " skip xxx    #{c} ->  #{s}:#{e}"
        return
    end

    puts " ----------------------- run  #{c}   #{s}:#{e}"
    ki = 9
    toswap = s
    until ki < 0 do
        k = ki.to_s
        key_k_section_start = toswap
        for cursor in key_k_section_start..e
            if ar[cursor][c] == k
                swap(ar, toswap, cursor)
                toswap+=1
            end
        end

        # after this key is done
        # xxx.xxx.xxx.xxx
        if c<10
            rs(ar,c+1,key_k_section_start,toswap-1)
        end
        ki-=1
    end

    # bottom are all with . at current
    puts " current  toswap:e #{toswap}:#{e}"
    if c<10
        rs(ar,c+1,toswap,e)
    end

end


# swap r1 with r2
def swap(ar, r1, r2)
    t = ar[r1]
    ar[r1] = ar[r2]
    ar[r2] = t
end



rs(lines,0,0,len-1)

puts lines

