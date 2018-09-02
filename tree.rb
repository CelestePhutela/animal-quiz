class Tree
  attr_accessor :root

  def initialize(value)
      @root = Node.new(value)
  end 
  
  def getter
    puts "printing value of root"
    self.root.getter
  end  
end


