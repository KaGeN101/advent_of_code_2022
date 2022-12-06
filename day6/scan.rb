
@stream = File.read('input.txt')
@length = 0

def calculate start, size
    marker = ""
    (start..@stream.length).each do |index|
        if marker.include? @stream[index]
            marker = ""
            #puts "-=-=-=-=-=-="
        end
        marker += @stream[index]
        @length += 1
        #puts marker
        if marker.length == size
            break
        end
    end
end

calculate @length, 4
puts @length
# Part 2
puts "[][][][][][][][][Part 2][][][][][][][][][]"
@length = @length - 4
calculate @length, 14
puts @length-1

