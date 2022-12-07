require_relative 'directory'

class State

    attr_reader :root

    def initialize
        @root = nil
        @current = nil
        @parent = nil
    end

    def cd name
        if name == "/"
            @root = DevDirectory.new(name)
            @current = @root
        end
        if name != '..' && name != '/'
            @parent = @current
            @current = DevDirectory.new(name)
            @current.set_parent @parent
        end
        if name == ".."
            @current = @parent
        end
    end

    def list
        # does nothing
        #puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        #puts "Current Directory: #{@current.name}"
    end 
    
    def scan thing
        if thing[0] == 'dir' 
            @current.add_dir DevDirectory.new(thing[1])
        end
        if thing[0] != 'dir' 
            @current.add_file DevFile.new(thing[1], thing[0].to_i)    
        end
    end
end

state = State.new()

File.foreach("sample.txt") do |line|
    if line.include?('$ cd') 
        state.cd line.split(' ')[2]   
        next
    end
    if line.include?("$ ls") 
        state.list
        next
    end
    state.scan line.split        
end



def scan_folder folder, size
    folder.contents.each do |name, thing|
        if thing.class == DevDirectory
            p thing
            return scan_folder thing, size
        else 
            size += thing.size
        end
    end
    return size
end


p state.root

root_size = scan_folder(state.root, state.root.size)
puts root_size


