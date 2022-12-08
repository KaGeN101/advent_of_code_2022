
class Tree

    def initialize(row, col, height)
        @row = row
        @col = col
        @height = height
    end

end

class Patch

    def initialize(width, height)
        @width = width
        @height = height
        @patch = Array.new(@width) { Array.new(@height)}
    end 

    def get(row, col)
        return @patch[row][col]
    end

    def parse lines
        row = 0
        col = 0
        lines.each do |line|
            line = line.strip
            line.each_char do |char|
                @patch[row][col] = char
                col += 1
            end
            col = 0
            row += 1
        end
    end

    def draw (row, col, size)
        patch_st = ""
        (row..size-1).each do |r|
            (col..size-1).each do |c|
                if @patch[r][c] == nil
                    patch_st += 'n'
                else
                    patch_st += @patch[r][c]
                end
            end
            patch_st += "\n"
        end
        puts patch_st
        return patch_st
    end

end 