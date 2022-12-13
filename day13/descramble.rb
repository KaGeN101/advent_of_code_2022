require 'json'

class Status

    @RIGHT_ORDER = 0
    @WRONG_ORDER = 1
    @CONTINUE = 2

    class << self
        attr_reader :RIGHT_ORDER, :WRONG_ORDER, :CONTINUE
    end
    
end    

def check_numbers(x, y)
    if x < y
        return Status.RIGHT_ORDER
    end
    if y < x
        return Status.WRONG_ORDER
    end
    return Status.CONTINUE
end

def check(x, y)
    if x.is_a?(Numeric) and y.is_a?(Numeric)
        return check_numbers(x, y)
    elsif x.is_a?(Numeric)
        return check([x], y)
    elsif y.is_a?(Numeric)
        return check(x, [y])
    elsif x==nil && y != nil
        return Status.RIGHT_ORDER
    elsif  x != nil && y == nil
        return Status.WRONG_ORDER
    elsif !(x.size && y.size)
        return Status.RIGHT_ORDER
    elsif x.size && !y.size
        return Status.WRONG_ORDER
    elsif !x.size && !y.size
        return Status.CONTINUE
    else
        status = check(x[0], y[0])
        if status == Status.CONTINUE
            #if x.size > 0 && y.size > 0
                return check(x[1..x.size], y[1..y.size])
            #end
        end
        return status
    end
end

data = File.read("sample2.txt")
pairs = data.split("\n\n")

total = 0
pairs.each_index do |idx|
    split = pairs[idx].split("\n")
    part_1 = JSON.parse(split[0])
    part_2 = JSON.parse(split[1])
    if check(part_1, part_2) == Status.RIGHT_ORDER
        puts "Right Order Index: #{idx + 1}"
        total += idx + 1
    end
end

puts total