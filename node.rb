class Node

attr_accessor :value,:left,:right,:parent
def initialize(value=nil,left=nil,right=nil,parent=nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
end

def getter
    puts "value is #{self.value}"
    puts "left node is #{self.left.value unless self.left.nil?}"
    puts "right value is #{self.right.value unless self.right.nil?}"
    puts "parent is #{self.parent.value unless self.parent.nil?}"
end


def position
    left_value=self.parent.left.value
    right_value=self.parent.right.value
    if self.value == left_value
        return "left"
    elsif self.value == right_value
         return "right"
    end         
end 

def is_root?
    return self.parent.nil? ? true : false
end

end



