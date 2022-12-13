require 'json'   

class Pair

    attr_reader :index, :ordered

    def initialize(index, left_packet, right_packet)
        @index = index
        @left_packet = JSON.parse(left_packet)
        @right_packet = JSON.parse(right_packet) 

        @ordered = true
    end

    def check()
        (0..@left_packet.size-1).each do |index|
            #puts "Doing Index: #{index}"
            result = compare(@left_packet[index], @right_packet[index])
            #puts result
            if !result
                @ordered = false
                break
            end
        end    
    end

    def compare(lhs, rhs)
        # p lhs
        # p rhs
        if lhs.is_a?(Array) && rhs.is_a?(Array)
            to_use = lhs
            if rhs.size < lhs.size
                if rhs.size == 0
                    return false
                end
                to_use = rhs
            end
            (0..to_use.size-1).each do |index|
                #puts "We looping here: #{index}"
                result = compare(lhs[index], rhs[index])
                if !result
                    return result
                end
            end 
            return true
        end
        if lhs.is_a?(Numeric) && rhs.is_a?(Numeric)
            #puts "came herev N and N"
            return lhs <= rhs
        end
        if lhs.is_a?(Numeric) && rhs.is_a?(Array)
            return compare([lhs], rhs)
        end
        if lhs.is_a?(Array) && rhs.is_a?(Numeric)
            return compare(lhs, [rhs])
        end
        # puts "GOT here"
    end

end

index = 1
cache = {}
pairs = []
File.foreach("input.txt") do |line|
    #p line
    if !cache.key? index
        cache[index] = []
    end
    cache[index] << line.strip
    if line == "\n"
        # puts "Doing Pair:"
        # puts cache[index][0]
        # puts cache[index][1]
        pairs << Pair.new(index, cache[index][0], cache[index][1])
        index += 1
    end
end 

#p cache
#puts "-=-=-=-=-=--=-=-=-=-=-="
#p pairs

ordered =[]
pairs.each do |p|
    if p.ordered
        ordered << p.index
    end
end
p ordered
sum = 0;
ordered.each do |o|
    sum += o
end
puts "Total: #{sum}"