
puts "wtf"


base = '/Users/yubing/code/playground'
base ='/Users/yubing/other-'
base =  '/Users/yubing/Library/Caches'
base =  '/opt/cloudvm/vms'

base =  '/usr/local/Cellar/android-ndk-r10c/r10c'
base =  '/Users/yubing/Android/sdk'
base = '/usr/local/var/lib/cassandra/commitlog'


base = '/usr/local/'
puts "base : #{base}"


# cassandra log : 

Dir.foreach(base) do |item|
  next if item == '.' or item == '..'

  # do work on real items
  # puts " item:  #{item}     "
  d = base+"/"+item
  # s = FileTest.size?(d)
  # puts " #{d}  size : #{s}"
  # puts File.stat(d).size
  # puts File.stat(d).directory?
  du_res = `du -s #{d}`
  # puts du_res
  size = /^[0-9]+/.match(du_res)

  # if !size.nil? && size.length > 3
    puts " #{d}  "
    puts " size from du:  #{size}"
  # end
end

