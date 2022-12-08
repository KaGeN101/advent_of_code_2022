require_relative "patch"

data = File.read("input.txt")
data_split = data.split("\n")
patch = Patch.new data_split.size, data_split[0].length
patch.parse data_split
patch.walk
visible = patch.get_total_visible
patch.draw_visible
puts "Total Edges: #{patch.get_total_edge}"
puts "Total Visib: #{visible}"
puts "Total: #{patch.get_total_edge + patch.get_total_visible}"
