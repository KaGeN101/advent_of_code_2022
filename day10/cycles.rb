

def noop
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
end

def addx
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
end

def add_number value
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
    @cycle += 1
    @counter += value
    @register[@cycle] = @counter
    @register_array << @counter
    
end

@cycle = 0
@counter = 1
@register = {}
@register_array = []
File.foreach("sample.txt") do |line|
    line = line.strip
    if line == "noop"
        noop
    else
        counter = line.split(' ')[1].to_i
        add_number counter
    end
end

p @register_array
p @register

_20 = @register[20] * 20
_20a = @register_array[19] * 20
puts _20
puts _20a
_60 = @register[60] * 60
_60a = @register_array[59] * 60
puts _60
puts _60a
_100 = @register[100] * 100
_100a = @register_array[99] * 100
puts _100
puts _100a
_140 = @register[140] * 140
_140a = @register_array[139] * 140
puts _140
puts _140a
_180 = @register[180] * 180
_180a = @register_array[179] * 180
puts _180
puts _180a
_220 = @register[220] * 220
_220a = @register_array[219] * 220
puts _220
puts _220a

p @register_array
p @register

puts "Part 1: "
puts _20 + _60 + _100 + _140 + _180 + _220
puts _20a + _60a + _100a + _140a + _180a + _220a