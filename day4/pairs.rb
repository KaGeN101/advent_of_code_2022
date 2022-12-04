
class Pair 

    attr_reader :flatten_a, :flatten_b, :flatten_set

    def initialize(number, pair)
        @number = number
        splitted = pair.split(',')
        @range_a = splitted[0]
        @flatten_a = flatten_range @range_a
        @range_b = splitted[1]
        @flatten_b = flatten_range @range_b

                                                    # 49-51,31-50
        @flatten_set = {a: flatten_a, b: flatten_b} # {1: {a: [49, 50, 51], b: [31, 32, 33, ..., 50]}}     
    end    

    private

    # Takes in a range '6-11' and returns an [6, 7, 8, 9, 10, 11]
    def flatten_range range
        splitted = range.split('-')
        flatten = []
        (splitted[0].to_i .. splitted[1].to_i).each {|i| flatten << i}
        return flatten
    end

end


class Pairs 

    attr_reader :flattened

    def initialize()
                        # 49-51,31-50
        @flattened = {} # {1: Pairs::{a: [49, 50, 51], b: [31, 32, 33, ..., 50]}}
        @only_as = []
        @only_bs = []
    end

    def add_pair(number, range)
        pair = Pair.new(number, range)
        @flattened[number] = pair
        @only_as << pair.flatten_a
        @only_bs << pair.flatten_b    
    end    

end

