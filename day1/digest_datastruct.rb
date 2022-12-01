# TODO: Make the file to process passed in ARGV

elfs = {}
elf_number = 0
calories = Array.new()
# Read the file and break up to per Elf
File.foreach("input.txt") do |line| 
    if line.strip.length == 0
        elf_number += 1
        elfs[elf_number] = calories
        #puts "ELF Number #{elf_number} total: #{elf.total}"
        calories = Array.new()
    else     
        calories << line.to_i
    end     
end    

# Find elf with most calories
biggest = 0
biggest_elf = 0
elfs.each do |number, elf|
    total = 0
    elf.each {|cal| total += cal}
    if total > biggest
        biggest = total
        biggest_elf = number
    end
end    

puts "Elf with most calories: #{biggest_elf} with Total #{biggest}"


