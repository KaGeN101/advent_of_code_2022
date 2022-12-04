
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

    attr_reader :flattened, :only_as, :only_as_sorted, :only_bs

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
        @only_as_sorted = @only_as.sort_by(&:size)
        @only_bs << pair.flatten_b    
        @only_as_sorted = @only_bs.sort_by(&:size)
    end    

    def combine a, b
        combined = []
        combined = a + b
        return combined
    end
    
    def combine_sort a, b
        combined = combine a, b
        return combined.sort_by(&:size)
    end

    def save_flattened
        to_write = ""
        pairs.flattened.each do |number, pair|
            to_write += "#{pair.flatten_set}\n"
        end    
        File.open('output_flattened.txt', 'w+') {|f| f.write(to_write)}
    end 

    def save name, array
        to_write = ""
        array.each do |flat|
            to_write += "#{flat}\n"
        end    
        File.open("output_#{name}.txt", 'w+') {|f| f.write(to_write)}

    end

end

