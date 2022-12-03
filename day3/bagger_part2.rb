
# Just do some rudementary setups 
scores = {}
start = 0
("a".."z").each {|l| scores[l] = start+=1}
start = 26
("a".."z").each {|l| scores[l.upcase] = start+=1}
#p scores

def find_badge grouped
    grouped[0].each_char do |char|
        if grouped[1].include?(char) && grouped[2].include?(char)
            return char
        end   
    end
end

bags_duplicates = []
group = []
bag_number = 0
File.foreach("input.txt") do |line| 
    line.strip!
    bag_number += 1
    group << line
    if bag_number % 3 == 0
        dup = find_badge group
        bags_duplicates << dup
        #puts "Group"
        #p group
        #puts dup
        #puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
        group = []
    end    
end

total = 0
bags_duplicates.each do |dup|
    total += scores[dup]
end

puts total