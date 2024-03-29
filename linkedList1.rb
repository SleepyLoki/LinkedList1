class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  # Push a value onto the stack
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    old_head = @data
    @data = @data && @data.next_node
    old_head
  end
end

#Defs
def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
  end
end

def reverse_list(list)
  stack = Stack.new
  while list != nil
    stack.push(list.value)
    list = list.next_node 
  end
  return stack.data
end

#Data
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(44, node3)
node5 = LinkedListNode.new(54, node4)
node6 = LinkedListNode.new(3, node5)


#Print Output
print_values(node6)
puts "-------"
revlist = reverse_list(node6)
print_values(revlist)

#Linked List Example Outputs

# Creates a new Stack object
stack = Stack.new

# Pushes (adds) the number 1 to the empty stack
stack.push(1)

# Pushes the number 2 to the TOP of the stack
stack.push(2)

# Pops (removes) the TOP number from the stack (2)
puts stack.pop
# => 2

# Pops the remaining number from the stack (1)
puts stack.pop
# => 1

# Tries to pop the TOP number from the stack,
# but it is empty so it returns nil
puts stack.pop
# => nil