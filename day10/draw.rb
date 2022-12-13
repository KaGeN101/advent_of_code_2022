
@sprite = "###....................................."
@crt_row = ""

def noop
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
    @crt_row += @sprite[@register[@cycle]-1]
end

def addx
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
    @crt_row += @sprite[@register[@cycle]-2]
end

def graphics value
    if value > 0
        add_to_sprite = ""
        (1..value).each {|i| add_to_sprite += "."}
        @sprite = add_to_sprite + @sprite
        @sprite = @sprite[0..39]
        #puts @sprite
    else
        value = value * -1
        @sprite = @sprite[value..@sprite.length-1]
        (1..value).each {|i| @sprite += "."}
        #puts @sprite
    end
end

def add_number value
    @cycle += 1
    @register[@cycle] = @counter
    @register_array << @counter
    @crt_row += @sprite[@register[@cycle]-1]
    puts @crt_row
    @counter += value
    @register[@cycle] = @counter
    @register_array << @counter
    graphics value
    if @crt_row.length == 40
        puts @crt_row
        @crt_row = ""
    end
end

@cycle = 0
@counter = 1
@register = {}
@register_array = []
File.foreach("sample.txt") do |line|
    line = line.strip
    #puts "Doing: #{line}"
    #puts @sprite
    if line == "noop"
        noop
        #puts @crt_row
    else
        counter = line.split(' ')[1].to_i
        addx
        #puts @crt_row
        add_number counter
        #puts @crt_row
    end
    #puts @register[@cycle]
    if @crt_row.length == 40
        puts @crt_row
        @crt_row = ""
    end
end