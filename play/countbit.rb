

ar = [1,23,4,3,5,45,33,65,6,1,23,4,3,5,45,33,65,83]



puts ar






ar.each { |n|

    puts " n=>  #{ n}"

    for i in 24..32

        bit_at_i  = n>>(32-i)
        puts bit_at_i&1

        # puts " #{n>>>(32-i)}"
    end
}