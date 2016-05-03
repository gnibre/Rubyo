


# what it do, given a url file name, 
# file with url in each line,
# it will automatic generate a json file, that having the correct format, to post.

def url_file_to_json(filename, num=0)

    spider = "order_ahead:parse_leaf"

    
    dn = File.dirname(__FILE__)
    f = File.open(dn+"/../dataurls/#{filename}.urls")

    name_suffix = "all"
    if num>0
        name_suffix  = num.to_s
    end


    fo  = File.open(dn+"/../dataurls/#{filename}_#{name_suffix}.json","w+")

  #   "entries": [
  #   {
  #     "url": "https://www.orderaheadapp.com/robots.txt",
  #     "spider": "order_ahead:_parse_sitemap"
  #   }
  # ]

    fo.write('"entries": [')
    fo.write("\n")

    lines = f.readlines
    c = 0
    lines.each { |l|
        c+=1
        if(num>0 && c>num)
            puts " break at num : #{num}"
            break
        end

        url = l.chop
        fo.write('{"url": "'+url+'",')
        fo.write('"spider": "'+spider+'"},')
        fo.write("\n") # not '\n' please
    }

    fo.write("]\n")

    puts f
    puts fo

    f.close
    fo.close

end


#

url_file_to_json 'orderahead'

puts "cool"
