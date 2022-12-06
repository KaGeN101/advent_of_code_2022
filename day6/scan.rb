
stream = File.read('input.txt')

marker = ""
length = 0
stream.each_char do |char|
    if marker.include? char
        marker = ""
        #puts "-=-=-=-=-=-="
    end
    marker += char
    length += 1
    #puts marker
    if marker.length == 4
        break
    end
end

puts length

# Part 2
puts "[][][][][][][][][Part 2][][][][][][][][][]"
length = length - 4
maker = ""
# now go from length - 4
(length .. stream.length).each do |index|
    if marker.include? stream[index]
        marker = ""
        #puts "-=-=-=-=-=-="
    end
    marker += stream[index]
    length += 1
    #puts marker
    if marker.length == 14
        break
    end
end

puts length-1

