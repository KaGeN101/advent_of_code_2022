

directories = {}
directory = "/"
previous = "/"
size = 0
number_dirs = 0
File.foreach("input.txt") do |line|
    if line[0..3] == "$ cd"
        previous = directory
        directory = line.split(' ')[2]
        puts directory
        if directory == ".." # Moving between directories
            directories[previous] = size
            directory = ""
            size = 0
        end
    else 
        if !line.include?('$ ls') && !line.include?('dir')
            split = line.split(' ')
            if split.size == 2
                puts split[0].to_i
                size += split[0].to_i
            end
        end
    end

end

p directories
puts "-=-=-=-=-=-=-=-=-=-=-=-="
puts number_dirs
puts directories.size
#puts directories["/"]

total_of_all_dirs_less_than_100k = 0
directories.each do |dir, size|
    if size <= 100000
        puts dir
        total_of_all_dirs_less_than_100k += size
    end
end

puts total_of_all_dirs_less_than_100k
