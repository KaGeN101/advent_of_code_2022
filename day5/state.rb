
class Crate

    attr_reader :x, :y

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
    end 

end