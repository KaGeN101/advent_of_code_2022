
class Tree

    attr_reader :row, :col, :height, :is_edge, :is_visible, :up, :right, :down, :left

    def initialize(row, col, height, is_edge)
        @row = row
        @col = col
        @height = height
        @is_edge = is_edge   
    end

    def to_s
        @height.to_s
    end

    def set_around up, right, down, left
        @has_set = true
        @up = up
        @right = right
        @down = down
        @left = left
    end

    def set_is_visible visible
        @is_visible = visible
    end
    
    def print
        out = ""
        if @is_edge
            out = "I am na edge don't have around and can be seen :)!"
            puts out
            return out
        end
        if @has_set
            row_a = " #{@up.to_s} \n"  
            row_b = "#{@left.to_s}#{@height.to_s}#{@right.to_s}\n"
            row_c = " #{@down.to_s} \n"
            out = row_a + row_b + row_c
            puts out
        else
            out = "set_around before calling print!"
            puts out
        end  
        return out
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
                edge =  col == 0 || row == 0 || col == @width-1 || row == @height-1 
                @patch[row][col] = Tree.new(row, col, char.to_i, edge)
                col += 1
            end
            col = 0
            row += 1
        end
    end

    def discover row, col
        tree = @patch[row][col]
        if !tree.is_edge
            tree.set_around @patch[row-1][col], @patch[row][col+1], @patch[row+1][col], @patch[row][col-1]
        end
    end

    def walk
        (0..@height-1).each do |r|
            (0..@width-1).each do |c|
                discover(r, c)
            end
        end

    end

    def get_total_edge
        total = 0
        (0..@height-1).each do |r|
            (0..@width-1).each do |c|
                if @patch[r][c].is_edge
                    total += 1
                end
            end
        end
        return total
    end

    def determine_visible
        #@is_visible = @up.height < @height || @right.height < @height || @down.height < @height || @left.height < @height
        # Just focus on the middle block
        (1..@height-2).each do |r|
            (1..@width-2).each do |c|
                tree = @patch[r][c]
                vissible_up = tree.up.height < tree.height
                vissible_right = tree.right.height < tree.height
                vissible_down = tree.down.height < tree.height
                vissible_left = tree.left.height < tree.height
                if !vissible_up && !vissible_right && !vissible_down && !vissible_left
                    next
                end
                if vissible_up
                    vissible_up = check_to_edge_row -1, tree
                end
                if vissible_right
                    vissible_up = check_to_edge_col 1, tree
                end
                if vissible_down
                    vissible_up = check_to_edge_row 1, tree
                end
                if vissible_right
                    vissible_up = check_to_edge_col -1, tree
                end
                vissilbe = vissible_up || vissible_right || vissible_down || vissible_left
                tree.set_is_visible vissilbe
            end
        end
    end 

    def get_total_visible
        determine_visible
        total = 0
        (0..@height-1).each do |r|
            (0..@width-1).each do |c|
                if @patch[r][c].is_visible
                    total += 1
                end
            end
        end
        return total
    end

    def draw (row, col, size)
        patch_st = ""
        (row..size-1).each do |r|
            (col..size-1).each do |c|
                if @patch[r][c] == nil
                    patch_st += 'n'
                else
                    patch_st += @patch[r][c].to_s
                end
            end
            patch_st += "\n"
        end
        puts patch_st
        return patch_st
    end

    #private 

    def check_to_edge_row direction, tree
        if direction == -1
            (tree.row.downto(0)).each do |row|
                if @patch[row][tree.col].height > tree.height
                    return false
                end
            end
        end 
        if direction == 1
            (tree.row.upto(@height-1)).each do |row|
                if @patch[row][tree.col].height > tree.height
                    return false
                end
            end
        end 
        return true
    end

    def check_to_edge_col direction, tree
        if direction == -1
            (tree.col.downto(0)).each do |col|
                if @patch[tree.row][col].height > tree.height
                    return false
                end
            end
        end
        if direction == 1
            (tree.col..@width-1).each do |col|
                if @patch[tree.row][col].height > tree.height
                    return false
                end
            end
        end
        return true
    end

end 