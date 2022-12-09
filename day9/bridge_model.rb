

class Bridge

    def initialize height, width
        @height = height
        @width = width
        @bridge =  Array.new(height) { Array.new(width)}

        @start = {row: height-1, col: 0, char: 's'}
        @head  = {row: height-1, col: 0, char: 'H'}
        @tail  = {row: height-1, col: 0, char: 'T'}
        
        @previous = nil
        @current = nil
    end

    def apply instruction
        split = instruction.strip.split(' ')
        direction = split[0]
        count = split[1].to_i
        # move head
        # move tail
    end

    def move_head direction, count
    end
    
    def move_tail direction, count
    end

    def draw 
        bridge_st = ""
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                if @bridge[row][col] == nil
                    bridge_st += '.'
                else
                    bridge_st += @bridge[row][col]
                end
            end
            bridge_st += "\n"
        end
        puts bridge_st
        return bridge_st
    end 


end