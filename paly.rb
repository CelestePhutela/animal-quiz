require File.expand_path('../node', __FILE__)
require File.expand_path('../tree', __FILE__)

tree = Tree.new("is it a horse ?")
node = tree.root
response = 'y'

def play_again(response)
    return response == 'y' ?  true : false 
end 

while play_again(response)
        puts "Think of an animal"
        puts node.value
        answer = gets.chomp()
        if answer == "y" and node.left.nil?
            puts "I won"
        elsif answer == "y" and !(node.left.nil?)
            node = node.left
            next
        elsif  answer == "n"  and !(node.right.nil?)
            node = node.right
            next
        else answer == "n" and node.right.nil?
            puts "you won"
            puts "help me learn"
            puts "what was the animal you were thinking of"
            new_animal =  gets.chomp
            puts "give me a question to distinguish between #{new_animal} and #{node.value.split[3]}"
            new_question = gets.chomp
            puts "what is your response for #{new_animal}"
            answer = gets.chomp
            new_question_node = Node.new(new_question)
            new_animal_node = Node.new("is it a #{new_animal} ?",nil,nil,new_question_node)
            if node.parent.nil?
                tree.root = new_question_node
            end
            if answer == 'y'
                new_question_node.left = new_animal_node
                new_question_node.right = node
             elsif answer == 'n'
                new_question_node.left = node
                new_question_node.right = new_animal_node
            end
            new_question_node.parent = node.parent
            unless node.is_root?
                position = node.position
                    if position == "left"
                        node.parent.left = new_question_node
                    elsif position == "right"
                         node.parent.right = new_question_node
                    end        
            end  
            node.parent = new_question_node  
            tree.getter
        end 
    puts "do you want to play_again?"
    response = gets.chomp()       
    node = tree.root
end

   
    
    
