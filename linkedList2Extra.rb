class LinkedList2
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

def reverse_list(list, previous = nil)
  old_head = list.next_node
  list.next_node = previous
  if old_head
    reverse_list(old_head, list)
  else
    list
  end
end

def double_list(list, previous = nil)
  current_node = list
  previous_node = previous

  while current_node
    if previous_node && current_node.next_node
      print "#{previous_node.value} <-- #{current_node.value} --> #{current_node.next_node.value}"
    else
      print " nil <-- #{current_node.value} --> nil "
    end      
    previous_node = current_node
    current_node = current_node.next_node
  end
end

def print_values(list_node)
  if list_node
    if list_node.prev_node
      print_values(list_node.prev_node)
    else
      print "nil "
    end
    print "<-- #{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
  end
end

node1 = LinkedList2.new(12)
node2 = LinkedList2.new(99, node1)
node3 = LinkedList2.new(37, node2)
node4 = LinkedList2.new(3, node3)
node5 = LinkedList2.new(67, node4)

# print_values(node5)
puts "-------------------------------------------------------------"
double_list(node5)

# revlist = reverse_list(node5)
# print_values(revlist)