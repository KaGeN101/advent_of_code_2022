require_relative "patch"

data = File.read("input.txt")
data_split = data.split("\n")
patch = Patch.new data_split.size, data_split[0].length
patch.parse data_split
patch.walk
visible = patch.get_total_visible
patch.draw_visible
puts "Part 1:"
puts "Total Edges: #{patch.get_total_edge}"
puts "Total Visib: #{visible}"
puts "Total: #{patch.get_total_edge + patch.get_total_visible}"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Part 2"
viewing_distances = []
(1..patch.height-2).each do |r|
    (1..patch.width-2).each do |c|
        #puts patch.get(r, c).viewing
        viewing_distances << patch.get(r, c).viewing
    end
end
p viewing_distances.sort