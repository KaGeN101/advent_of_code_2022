

class Bridge

    attr_reader :bridge, :tail, :tail_locations

    def initialize height, width
        @height = height
        @width = width
        @bridge =  Array.new(height) { Array.new(width)}

        @start = {row: height-1, col: 0, char: 's'}
        @head  = {row: height-1, col: 0, char: 'H'}
        @tail  = {row: height-1, col: 0, char: 'T'}
        
        @previous = nil
        @current = nil

        @tail_locations = {}
    end

    def apply instruction
        split = instruction.strip.split(' ')
        direction = split[0]
        count = split[1].to_i
        (1..count).each do 
            puts "Current  : #{@current}"
            puts "Previous : #{@previous}"
            puts "Direction: #{direction}"
            # move head
            move_head direction
            if has_gap direction
                # move tail
                move_tail direction
            end
            draw
            puts "\n"
        end
        if count == 1
            @previous = @current
        end
        puts "-=-=--=-=-=-=-=-=-=-==-===-="
    end

    def has_gap direction
        if direction == "U"
            if @previous == nil || @previous == @current
                puts "U"
                return @bridge[@tail[:row] - 1][@tail[:col]] == nil
            end
            if @previous == "R"
                puts "UR"
                return @bridge[@tail[:row] - 1][@tail[:col] + 1] == nil
            end
        end
        if direction == "R"
            if @previous == nil || @previous == @current
                return @bridge[@tail[:row]][@tail[:col] + 1] == nil
            end
            if @previous == "D"
                #/|\
                left = @bridge[@tail[:row] + 1][@tail[:col] - 1] == nil
                below = @bridge[@tail[:row] + 1][@tail[:col]] == nil
                right = @bridge[@tail[:row] + 1][@tail[:col] + 1] == nil
                return left && below && right 
            end    
        end
        if direction == "D"
            if @previous == nil || @previous == @current
                return @bridge[@tail[:row] + 1][@tail[:col]] == nil
            end
            if @previous == "L"
                return @bridge[@tail[:row] + 1][@tail[:col] - 1] == nil
            end
        end    
        if direction == "L"
            if @previous == nil || @previous == @current
                return @bridge[@tail[:row]][@tail[:col] - 1] == nil
            end
            if @previous == "D"
                #/|\
                left = @bridge[@tail[:row] + 1][@tail[:col] - 1] == nil
                below = @bridge[@tail[:row] + 1][@tail[:col]] == nil
                right = @bridge[@tail[:row] + 1][@tail[:col] + 1] == nil
                return left && below && right 
            end 
            if @previous == "U"
                return @bridge[@tail[:row] - 1][@tail[:col] - 1] == nil
            end
        end 
    end
            

    def move_head direction
        @current = direction
        @bridge[@head[:row]][@head[:col]] = nil
        if direction == "U"
            @head[:row] = @head[:row] - 1
        end
        if direction == "R"
            @head[:col] = @head[:col] + 1
        end
        if direction == "D"
            @head[:row] = @head[:row] + 1
        end
        if direction == "L"
            @head[:col] = @head[:col] - 1
        end
        put @head
        @current = direction
    end
    
    def move_tail direction
        # Before everymove alway clear the tail
        @bridge[@tail[:row]][@tail[:col]] = nil
        #if @previous == nil
            
                @tail_locations["#{@tail[:row]}-#{@tail[:col]}"] = {row: @tail[:row], col: @tail[:col], char: "#"}
                if direction == "U"
                    if @previous == "R"
                        @tail[:row] = @tail[:row] - 1
                        @tail[:col] = @tail[:col] + 1
                    end
                    if @previous == @current
                        @tail[:row] = @tail[:row] - 1
                    end
                end
                if direction == "R"
                    if @previous == "D"
                        @tail[:row] = @tail[:row] + 1
                        @tail[:col] = @tail[:col] + 1
                    end    
                    if @previous == nil || @previous == @current 
                        @tail[:col] = @tail[:col] + 1
                    end
                end
                if direction == "D"
                    if @previous == "L"
                        @tail[:row] = @tail[:row] + 1
                        @tail[:col] = @tail[:col] - 1
                    end
                    if @previous == "R"
                        @tail[:row] = @tail[:row] + 1
                        @tail[:col] = @tail[:col] + 1
                    end
                    if @previous == @current
                        @tail[:row] = @tail[:row] - 1
                    end
                end 
                if direction == "L"
                    if @previous == "U"
                        @tail[:row] = @tail[:row] - 1
                        @tail[:col] = @tail[:col] - 1
                    end
                    if @previous == "D"
                        @tail[:row] = @tail[:row] + 1
                        @tail[:col] = @tail[:col] - 1
                    end
                    if @previous == @current
                        @tail[:col] = @tail[:col] - 1
                    end
                end 
                @previous = @current
            
            put @tail
        #else
        #end
        
    end

    def put knot
        @bridge[knot[:row]][knot[:col]] = knot[:char] 
    end 

    def draw bridge=nil
        to_draw = @bridge
        if bridge
            to_draw = bridge
        end
        bridge_st = ""
        (0..@height-1).each do |row|
            (0..@width-1).each do |col|
                if to_draw[row][col] == nil
                    bridge_st += '.'
                else
                    bridge_st += to_draw[row][col]
                end
            end
            bridge_st += "\n"
        end
        puts bridge_st
        return bridge_st
    end 


end