
total_root = 0

# File.foreach("input.txt") do |line|
#     split = line.split(' ')
#     if split.size == 2 && split[0] != '$' && split[0] != 'dir'
#         puts line
#         total_root += split[0].to_i
#     end
# end

# puts total_root

lines = File.readlines("sample.txt")

directories = []
number_folders = 0
lines.each_index do |index|
    line = lines[index].strip
    if line.include?('$ cd')
        if line != '$ cd ..'
            #puts line
            number_folders += 1
            split = line.split(' ')
            directories << {split[2] => index}
        end
    end
end

puts number_folders
puts directories.size
#p directories

def get_total_for dir, lines
    total = 0
    (dir.values[0]+1..lines.size-1).each do |index|
        line = lines[index].strip
        if line != '$ ls'
            if line.include? '$'
                break
            end
            if !line.include? 'dir '
                split = line.split(' ')
                total += split[0].to_i
            end
        end
    end
    return total
end

# check if every line after the directory is a $ ls
directories.each do |dir|
    dir["total"] = get_total_for dir, lines
end 

p directories

total_all_files = 0
total_up_too_100k = 0
directories.each do |dir|
    total_all_files += dir["total"]
    if dir["total"] <= 100000
        total_up_too_100k += dir["total"]
    end
end 

puts total_all_files
puts total_up_too_100k

