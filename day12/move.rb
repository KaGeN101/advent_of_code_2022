
class Move

    def initialize row, col, value\
        @row = row
        @col = col
        @value = value
    end

    def heuristic
        @direction = ''
    end

end

class Terrian

    def initialize height, width
        @height = height
        @width = width
        @area =  Array.new(height) { Array.new(width)}
    end

    def parse line, row
    end

    def draw area=nil
        to_draw = @area
        if area
            to_draw = area
        end
        area_st = ""
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                area_st += to_draw[row][col]
            end
            area_st += "\n"
        end
        puts area_st
        return area_st
    end

end