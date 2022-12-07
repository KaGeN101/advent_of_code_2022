

class DevFile

    attr_reader :name, :size

    def initialize name, size
        @name = name
        @size = size
    end

    def set_parent directory
        @set_parent = directory
    end

end

class DevDirectory 

    attr_reader :name, :size, :contents, :parent

    def initialize name
        @name = name
        @size = 0
        @contents = {}
        @parent = nil
    end

    def set_parent directory
        @parent = directory
    end

    def add_file file
        @contents[file.name] = file
        @size += file.size
    end

    def add_dir dir
        @contents[dir.name] = dir
    end
    
end