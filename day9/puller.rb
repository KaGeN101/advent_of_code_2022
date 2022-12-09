require_relative "bridge_model"

bridge = Bridge.new(5, 6)

data = "R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"

moves = data.split("\n")
bridge.apply moves[0]
bridge.apply moves[1]
bridge.apply moves[2]
bridge.apply moves[3]
bridge.apply moves[4]
bridge.apply moves[5]
bridge.apply moves[6]
bridge.draw
puts "-=-=-=-=-=-Visits-=-=-=-=-=-=--="
tail_visits = Array.new(5) { Array.new(6)}
bridge.tail_locations.each do |key, value|
    tail_visits[value[:row]][value[:col]] = value[:char]
end
tail_visits[bridge.tail[:row]][bridge.tail[:col]] = '#' #bridge.tail[:char]
bridge.draw tail_visits