def fb

	'fbfbfbfbfb'
end

puts "fbhahahahput"



def hello giffname

	puts giffname

end



puts (hello 'gogogo')



def mtd(arg1="Dibya", arg2="Shashank", arg3="Shashank")  
  "#{arg1}, #{arg2}, #{arg3}."  
end  
puts mtd  
puts mtd("ruby")  


def foo(*my_string)  
  my_string.inspect  
end  
puts foo('hello','world')  
puts foo()


#greet {puts 'Hello， block named greet'} 

=begin  
  Ruby Code blocks are chunks of code between braces or  
  between do- end that you can associate with method invocations  
=end  
def call_block  
  puts 'Start of method'  
  # you can call the block using the yield keyword  
  yield  

  yield
  puts 'what is yield'
  yield  
  puts 'End of method'  
end  
# Code blocks may appear only in the source adjacent to a method call  
call_block {puts 'In the block.. '
puts "follow"
} 

puts "after all" 


def call_block2  


  yield('hello', 99) 
  puts "after" 
end  
call_block2 {|str, num| puts str + ' ' + num.to_s}  




def try  
  if block_given?  
    yield  
  else  
    puts "no block"  
  end  
end  
try # => "no block"  
try { puts "hello" } # => "hello"  
try do puts "hello" end # => "hello" 


x = 10  
5.times do |y; x|  
 puts " y? #{y}"
 puts " x? #{x}"
  x = y  
  puts "x inside the block: #{x}"  
end  
puts "x outside the block: #{x}"  



locations = ['Pune', 'Mumbai', 'Bangalore'] 
 
locations.each do |loc| 
  puts 'I love ' + loc + '!' 
  puts "Don't you?"  
end 


def mtdarry  
  10.times do |num|  
    square = num * num  
    puts " num? #{num}"
    puts " sqr? #{square}"
    return num, square if num > 5  
  end  
end  


num, square = mtdarry  
puts num  
puts square



#ENV.each {|k,v| puts "#{k}: #{v}"}

puts "string".object_id  
puts "string".object_id  
puts :symbol.object_id  
puts :symbol.object_id 




know_ruby = :yes  
if know_ruby == :yes  
  puts 'You are a Rubyist'  
else  
  puts 'Start learning Ruby'  
end 




people = Hash.new  
people[:nickname] = 'IndianGuru'  
people[:language] = 'Marathi'  
people[:lastname] = 'Talim'  
  
puts people[:lastname] # Talim  

puts :lastname


# print <<EOF
#   The price is #{$Price}.
# EOF


mtd(<<"THIS", 23, <<'THAT')
  Here's a line
  or two.
THIS
  and here's another.
THAT

    if true
      eval <<-EOS     # delimiters can be indented
              def foo
                print "foo\n"
        end
      EOS
          end










