 
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

def put_empty bridge, row, col

end

def put bridge, knot
    bridge[knot[:row]][knot[:col]] = knot[:char] 
end 

@tail_locations = {}
def move_tail bridge, tail, direction
    @tail_locations["#{tail[:row]}-#{tail[:col]}"] = {row: tail[:row], col: tail[:col], char: '#'}
    bridge[tail[:row]][tail[:col]] = nil
    if direction == "U"
        left  = bridge[tail[:row]-1][tail[:col]-1] != nil
        above = bridge[tail[:row]-1][tail[:col]] != nil
        right = bridge[tail[:row]-1][tail[:col]+1] != nil
        if left
            tail[:row] = tail[:row] - 1
            tail[:col] = tail[:col] - 1
        end
        if above
            # do nothing
        end
        if right
            tail[:row] = tail[:row] - 1
            tail[:col] = tail[:col] + 1
        end
        # If it is not in the palce above you anymore just more up
        if !left && !above && !right
            tail[:row] = tail[:row] - 1
        end 
    end
    if direction == "R"
        tail[:col] = tail[:col] + 1
    end
    if direction == "D"
        left  = bridge[tail[:row]+1][tail[:col]-1] != nil
        below = bridge[tail[:row]+1][tail[:col]] != nil
        right = bridge[tail[:row]+1][tail[:col]+1] != nil
        if left
            tail[:row] = tail[:row] + 1
            tail[:col] = tail[:col] - 1
        end
        if below
            # do nothing
        end
        if right
            tail[:row] = tail[:row] + 1
            tail[:col] = tail[:col] + 1
        end
        # If it is not in the palce above you anymore just more up
        if !left && !above && !right
            tail[:row] = tail[:row] + 1
        end 
    end
    if direction == "L"
        if is_first_direction
            left  = bridge[tail[:row]-1][tail[:col]-1] != nil
            above = bridge[tail[:row]-1][tail[:col]] != nil
            right = bridge[tail[:row]-1][tail[:col]+1] != nil
            if left
                tail[:row] = tail[:row] - 1
                tail[:col] = tail[:col] - 1
            end
            if above
                # do nothing
            end
            if right
                tail[:row] = tail[:row] - 1
                tail[:col] = tail[:col] + 1
            end
            # If it is not in the palce above you anymore just move left
            if !left && !above && !right
                tail[:col] = tail[:col] - 1
            end 
        else
            if 
    end
end

def move bridge, head, tail, instruction, is_first
    split = instruction.strip.split(" ")
    direction = split[0]
    count = split[1].to_i
    is_first_direction = true
    (1..count).each do |i|
        bridge[head[:row]][head[:col]] = nil
        if direction == "U"
            head[:row] = head[:row] - 1
        end
        if direction == "R"
            head[:col] = head[:col] + 1
        end
        if direction == "D"
            head[:row] = head[:row] + 1
        end
        if direction == "L"
            head[:col] = head[:col] - 1
        end
        put bridge, head
        if is_first
            put bridge, tail
            is_first = false
        else 
            move_tail bridge, tail, direction, is_first_direction
            is_first_direction = false
        end
        put bridge, tail
        draw bridge, 10, 10
        puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    end 
    
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
height = 10
width = 10
bridge =  Array.new(height) { Array.new(width)}

start = {row: height-1, col: 0, char: 's'}
head  = {row: height-1, col: 0, char: 'H'}
tail  = {row: height-1, col: 0, char: 'T'}

put bridge, head
draw bridge, height, width
puts "[][][][][][][][][ Start ][][][][][][][][]"
puts "Moving: #{moves[0]}"
move bridge, head, tail, moves[0], true
puts "Moving: #{moves[1]}"
move bridge, head, tail, moves[1], false
puts "Moving: #{moves[2]}"
move bridge, head, tail, moves[2], false
# first = 0
# moves.each do |move|
#     puts "Moving: #{move}"
#     first += 1
#     if first == 1
#         move bridge, head, tail, move, true
#     else
#         move bridge, head, tail, move, false
#     end
#     puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--="
# end

tail_visits = Array.new(height) { Array.new(width)}
@tail_locations.each do |key, value|
    put tail_visits, value
end
puts "[][][][][][][][][ Tail Visits ][][][][][][][][][]"
puts "Before adding start"
draw tail_visits, height, width
put tail_visits, start
puts "After adding start"
draw tail_visits, height, width
