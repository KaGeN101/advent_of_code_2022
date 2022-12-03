
# Just do some rudementary setups 
scores = {}
start = 0
("a".."z").each {|l| scores[l] = start+=1}
start = 26
("a".."z").each {|l| scores[l.upcase] = start+=1}
#p scores

def find_duplicate lhs, rhs 
    lhs.each_char do |char|
        if rhs.include? char
            return char
        end
    end
end

bags_duplicates = []
bag_number = 0
File.foreach("input.txt") do |line| 
    bag_number += 1
    line.strip!
    left_comp, right_comp = line.strip.chars.each_slice(line.length / 2).map(&:join)
    dup = find_duplicate left_comp, right_comp
    bags_duplicates << dup
    #puts "Bag: #{bag_number}"
    #puts left_comp
    #puts right_comp
    #puts dup
    #puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
end

total = 0
bags_duplicates.each do |dup|
    total += scores[dup]
end

puts total