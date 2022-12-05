
# Create Initial State
state_line = [] 
File.foreach("state.txt") {| line| state_line << line unless !line.include? '['}
state_line.reverse!

row, col = 0
state_line.each do |r|
    r.strip!
    splitted = r.split(' ')
    
end  

