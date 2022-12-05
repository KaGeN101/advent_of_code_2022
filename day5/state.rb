
class Crate

    attr_reader :x, :y, :value

    def initialize(x , y, value)
        @x = x
        @y = y
        @value = value
    end

end

class State

    def initialize()
        @yard = Array.new(8) { Array.new(9)} # rows | coloumns
    end

    def add crate
        @yard[crate.x][crate.y] = crate
    end

    def to_s
        stack = []
        one_row = ""
        (0..7).each do |row|
            (0..8).each do |col|
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
        p stack.reverse
        #stack.reverse.each do |row|
        #    putc row
        #end
    end 

end