require_relative "bridge_model"

bridge = Bridge.new(50, 50)

data = "R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"
data = File.read("input.txt")

moves = data.split("\n")
# moves.each do |move|
#     puts "Doing move: #{move}"
#     bridge.apply move
# end
bridge.apply moves[0]
bridge.apply moves[1]
bridge.apply moves[2]
bridge.apply moves[3]
bridge.apply moves[4]
bridge.apply moves[5]
bridge.apply moves[6]
bridge.apply moves[7]
bridge.apply moves[8]
bridge.apply moves[9]
bridge.apply moves[10]
bridge.apply moves[11]
bridge.apply moves[12]
bridge.apply moves[13]
bridge.apply moves[14]
bridge.apply moves[15]
bridge.apply moves[16]
#bridge.apply moves[17]
bridge.draw
puts "-=-=-=-=-=-Visits-=-=-=-=-=-=--="
tail_visits = Array.new(50) { Array.new(50)}
bridge.tail_locations.each do |key, value|
    tail_visits[value[:row]][value[:col]] = value[:char]
end
tail_visits[bridge.tail[:row]][bridge.tail[:col]] = "#" #bridge.tail[:char]
bridge.draw tail_visits
puts bridge.tail_locations.size + 1 # for the last place