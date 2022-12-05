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
        puts crate
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