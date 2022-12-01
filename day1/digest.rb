# TODO: Make the file to process passed in ARGV

class Elf
    attr_reader :number, :calories, :total

    def initialize number, calories
        @number = number
        @calories = calories
        calculate_total
    end    

    private

    def calculate_total
        @total = 0
        @calories.each do |cal|
            @total += cal 
        end   
    end    
end

elfs = {}
elf_number = 0
calories = []
# Read the file and break up to per Elf
File.foreach("input.txt") do |line| 
    if line.strip.length == 0
        elf_number += 1
        elf = Elf.new(elf_number, calories)
        elfs[elf_number] = elf
        #puts "ELF Number #{elf_number} total: #{elf.total}"
        calories = []
    else     
        calories << line.to_i
    end     
end    

# Find elf with most calories
biggest = 0
biggest_elf = 0
elfs.each do |number, elf|
    if elf.total > biggest
        biggest = elf.total
        biggest_elf = number
    end
end    

puts "Elf with most calories: #{biggest_elf} with Total #{biggest}"


