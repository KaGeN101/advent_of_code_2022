

# Takes in a range '6-11' and returns an [6, 7, 8, 9, 10, 11]
def flatten_range range
    splitted = range.split('-')
    flatten = []
    (splitted[0].to_i .. splitted[1].to_i).each {|i| flatten << i}
    return flatten
end
                     # 49-51,31-50
pairs_flattened = {} # {1: {a: [49, 50, 51], b: [31, 32, 33, ..., 50]}}
set_contained = {}   # {1a: 12}  - represents how many times set 1a is wholly contained somewhere
pair = 0
File.foreach("input.txt") do |line| 
    pair += 1
    splitted = line.split(',')
    set = {a: flatten_range(splitted[0]), b: flatten_range(splitted[1])}
    pairs_flattened[pair] = set
end

to_write = ""
pairs_flattened.each do |number, set|
    to_write += "#{set}\n"
end    
File.open('output.txt', 'w+') {|f| f.write(to_write)}
#p pairs_flattened