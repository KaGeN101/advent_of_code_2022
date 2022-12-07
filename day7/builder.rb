
class Node 

    attr_reader :name, :size, :total, :children

    def initialize name, size=nil
        @name = name
        @size = size
        @children = []
        @total = nil 
    end

    def set total
        @total = total
    end

    def add child
        @children << child
    end 

end

tree = nil 
stack = []
File.foreach("input.txt") do |line|
    line = line.strip
    if line.include? ('$ cd')
        split = line.split(' ')
        if split[2] != '..'
            node = Node.new(split[2])
            if stack.size == 0
                tree = node
            else
                stack[stack.size-1].add node
            end
            stack << node
        else
            stack.pop
        end
    else
        if line != '$ ls'
            if !line.include? 'dir'
                dir = stack[stack.size-1]
                split = line.split(' ')
                node =  Node.new(split[1], split[0].to_i)
                dir.add node
            end 
        end
    end
end
#p tree
#puts tree.children.size

def calculate_total dir
    total = 0
    dir.children.each do |child|
        if child.size
            #p child  
            total += child.size
        else
            #p child
            calculate_total child
            total += child.total
        end
    end
    dir.set total
end

calculate_total tree
#p tree
#puts "-=-=-=-=-=-=-=---=-=-=-=-==-=--="
def print_totals dir
    dir.children.each do |child|
        if child.total
            puts "#{child.name}: #{child.total}"
            print_totals child
        end
    end
end
#print_totals tree
#puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-==-"

@part_one = 0
def part1 dir
    dir.children.each do |child|
        if child.total
            if child.total <= 100000
                #puts "#{child.name}: #{child.total}"
                @part_one += child.total
            end
            part1 child
        end
    end
end
part1 tree
puts "Part 1:"
puts @part_one
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-="

def part2 dir
    dir.children.each do |child|
        if child.total
            if child.total > 1609574 && child.total < 1700000
                puts "#{child.name}: #{child.total}"
            end
            part2 child
        end
    end
end
puts "Part 2:"
part2 tree