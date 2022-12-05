
class Crate

    attr_reader :x, :y, :value

    def initialize(x , y, value)
        @x = x
        @y = y
        @value = value
    end

end

class Instruction

    attr_reader :count, :from, :to

    def initialize(move, from, to) 
        @count = move
        @from = from
        @to = to
    end

end

class State

    attr_reader :yard

    def initialize()
        #TODO: replace magic number sizes and lengths with constants
        @width = 50
        @height = 50
        @yard = Array.new(@height) { Array.new(@width)} # rows | coloumns
    end

    def add crate
        if crate
            @yard[crate.x][crate.y] = crate
        end
    end

    def move instruction, is_9001=false
        col_from = instruction.from - 1
        row_top_from = get_row_top col_from
        to_move = []
        (row_top_from).downto(row_top_from-instruction.count+1).each do |row|
             to_move << @yard[row][col_from]
             @yard[row][col_from] = nil
        end
        col_to = instruction.to - 1
        row_top_to = get_row_top col_to 
        if row_top_to == -1
            row_top_to = 0
        else 
            row_top_to += 1
        end
        if is_9001
            to_move = to_move.reverse
        end
        to_move.each do |crate|
            @yard[row_top_to][col_to] = crate
            row_top_to += 1
        end
    end

    def total_crates
        total = 0
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                if @yard[row][col] 
                    total += 1
                end
            end
        end
        return total
    end 

    def to_s
        stack = []
        one_row = ""
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                if @yard[row][col] 
                    one_row += "[#{@yard[row][col].value}]"
                else 
                    one_row += "   "
                end
                one_row += " "
            end   
            one_row += "\n"
            stack << one_row
            one_row = ""
        end
        stack.reverse
    end 

    private 

    def get_row_top col
        row_top = -1
        (@height-1).downto(0).each do |row|
            if @yard[row][col]
                row_top = row
                break
            end
        end
        return row_top
    end

end