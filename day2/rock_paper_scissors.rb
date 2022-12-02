class RockPaperScissors

    def initialize
        @instance_values = {
            'X' => 1,
            'Y' => 2,
            'Z' => 3
        }

        @outcome_values = {
            L: 0,
            D: 3,
            W: 6 
        }
    end

    def outcome opponet, me
        score = 0
        if opponet == "A"
            if me == "X"
                #me is Z=rock a draw
                score = @outcome_values[:D] + @instance_values[me] 
            else
                if me == "Y"
                    #me win
                    score = @outcome_values[:W] + @instance_values[me]
                else
                    #opponent win
                    score = @outcome_values[:L] + @instance_values[me] 
                end        
            end        
        end
        if opponet == "B"
            if me == "X"
                #opponet win
                score = @outcome_values[:L] + @instance_values[me]
            else
                if me == "Y"
                    #me is Y=paper a draw
                    score = @outcome_values[:D] + @instance_values[me]
                else
                    #me win    
                    score = @outcome_values[:W] + @instance_values[me]
                end        
            end        
        end
        if opponet == "C"
            if me == "X"
                #me win
                score = @outcome_values[:W] + @instance_values[me]
            else
                if me == "Y"
                    #opponet win
                    score = @outcome_values[:L] + @instance_values[me]  
                else
                    #me is X=scissors a draw
                    score = @outcome_values[:D] + @instance_values[me]
                end        
            end        
        end
        return score 
        
    end
end