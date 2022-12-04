require_relative 'pairs'

pairs = Pairs.new
pair = 0
File.foreach("input.txt") do |line| 
    pair += 1
    pairs.add_pair(pair, line)
end

fully_contained_range_count = 0
count_equal_section = 0
fully_contained_equal_range_count = 0
count_smaller_a_section = 0
fully_contained_smaller_a_range_count = 0
count_smaller_b_section = 0
fully_contained_smaller_b_range_count = 0
pairs.only_as.each_with_index do |assignment_a, index|
    assignment_b = pairs.only_bs[index]
    # check how and which ones can contain each other
    # Same size assignments
    if assignment_a.size == assignment_b.size 
        count_equal_section += 1
        wholly_contained = true
        assignment_a.each do |section|
            if !assignment_b.include?(section)
                wholly_contained = false
                break
            end
        end
        if wholly_contained
            fully_contained_equal_range_count += 1
        end
    end
    # a is smaller than b
    if assignment_a.size < assignment_b.size
        count_smaller_a_section += 1
        # check if b range can contain a
        if assignment_b[0] <= assignment_a[0]
            wholly_contained = true
            assignment_a.each do |section|
                if !assignment_b.include?(section)
                    wholly_contained = false
                    break
                end
            end
            if wholly_contained
                fully_contained_smaller_a_range_count += 1
            end
        end    
    end
    # b is smaller than a     
    if assignment_b.size < assignment_a.size
        count_smaller_b_section += 1
        if assignment_a[0] <= assignment_b[0]
            wholly_contained = true
            assignment_b.each do |section|
                if !assignment_a.include?(section)
                    wholly_contained = false
                    break
                end
            end
            if wholly_contained
                fully_contained_smaller_b_range_count += 1
            end
        end  
    end    
end    

puts "Went into this section count #{count_equal_section} - Wholly Contained Equal Count: #{fully_contained_equal_range_count}"
puts "Went into this section count #{count_smaller_a_section} - Wholly Contained Smaller A Count: #{fully_contained_smaller_a_range_count}"
puts "Went into this section count #{count_smaller_b_section} - Wholly Contained Smaller B Count: #{fully_contained_smaller_b_range_count}"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts "Total section count #{count_equal_section + count_smaller_a_section + count_smaller_b_section} - Wholly Contained Total Count: #{fully_contained_equal_range_count + fully_contained_smaller_a_range_count + fully_contained_smaller_b_range_count}"
puts "#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#"

count_equal_section = 0
count_equal_overlap = 0
count_smaller_a_section = 0
count_smaller_a_overlap = 0
count_smaller_b_section = 0
count_smaller_b_overlap = 0
# Part two
pairs.only_as.each_with_index do |assignment_a, index|
    assignment_b = pairs.only_bs[index]
    # check how and which ones can contain each other
    # Same size assignments
    if assignment_a.size == assignment_b.size 
        count_equal_section += 1
        wholly_contained = true
        assignment_a.each do |section|
            if assignment_b.include?(section)
                count_equal_overlap += 1
                break
            end
        end
    end
    # a is smaller than b
    if assignment_a.size < assignment_b.size
        count_smaller_a_section += 1
        assignment_a.each do |section|
            if assignment_b.include?(section)
                count_smaller_a_overlap += 1
                break
            end
        end
    end
    # b is smaller than a     
    if assignment_b.size < assignment_a.size
        count_smaller_b_section += 1
        assignment_b.each do |section|
            if assignment_a.include?(section)
                count_smaller_b_overlap += 1
                break
            end
        end
    end   
end    

puts "[][][][][][][][][][][][][][Part 2][][][][][][][][][][][][]["

puts "Went into this section count #{count_equal_section} - Overlap Equal Count: #{count_equal_overlap}"
puts "Went into this section count #{count_smaller_a_section} - Wholly Contained Smaller A Count: #{count_smaller_a_overlap}"
puts "Went into this section count #{count_smaller_b_section} - Wholly Contained Smaller B Count: #{count_smaller_b_overlap}"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts "Total section count #{count_equal_section + count_smaller_a_section + count_smaller_b_section} - Wholly Contained Total Count: #{count_equal_overlap + count_smaller_a_overlap + count_smaller_b_overlap}"
puts "#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#"