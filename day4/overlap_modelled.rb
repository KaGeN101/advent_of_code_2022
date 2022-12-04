require_relative 'pairs'

pairs = Pairs.new
pair = 0
File.foreach("input.txt") do |line| 
    pair += 1
    pairs.add_pair(pair, line)
end

to_write = ""
pairs.flattened.each do |number, pair|
    to_write += "#{pair.flatten_set}\n"
end    
File.open('output2.txt', 'w+') {|f| f.write(to_write)}
#p pairs_flattened

set_contained = {}   # {1a: 12}  - represents how many times set 1a is wholly contained somewhere