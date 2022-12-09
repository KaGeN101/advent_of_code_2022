 
def draw bridge, height, width
    bridge_st = ""
    (0..height-1).each do |row|
        (0..width-1).each do |col|
            if bridge[row][col] == nil
                bridge_st += '.'
            else
                bridge_st += bridge[row][col]
            end
        end
        bridge_st += "\n"
    end
    puts bridge_st
end     

def put bridge, knot
    bridge[knot[:row]][knot[:col]] = knot[:char] 
end 

data = "R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"

moves = data.split("\n")
height = 25
width = 25
bridge =  Array.new(height) { Array.new(width)}
start = {row: height-1, col: 0, char: 's'}
head  = {row: height-1, col: 0, char: 'H'}
tail  = {row: height-1, col: 0, char: 'T'}

put bridge, start
draw bridge, height, width
