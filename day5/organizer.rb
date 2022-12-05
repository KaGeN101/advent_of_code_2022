require_relative 'state'

# Create Initial State
state_line = [] 
File.foreach("state.txt") {| line| state_line << line unless !line.include? '['}
state_line.reverse!

state = State.new()

row = 0 
col = 0
index = 0
state_line.each do |r|
    while index < r.length
        crate = r[index ... index+3]
        if crate.include? '['
            state.add Crate.new(row, col, crate[1])
        end
        col += 1
        index += 4
    end
    col = 0
    row += 1
    index = 0
end  

puts state.to_s
puts "Total Crates: #{state.total_crates}"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

# Parse All the instructions
instructions = []
File.foreach("input.txt") do |line|
    splitted = line.strip.split(' ')
    instructions << Instruction.new(splitted[1].to_i, splitted[3].to_i, splitted[5].to_i)
end 

# Apply instructions
number = 0
instructions.each do |instruction|
    number += 1
    puts "Instruction: #{number}"
    puts "Total Crates: #{state.total_crates}"
    if number == 11
        puts state.yard[0][7].value
    end
    state.move instruction
    puts state.to_s
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
end
puts state.to_s