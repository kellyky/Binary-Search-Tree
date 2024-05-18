# frozen_string_literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

# TODOs:
# Tie it all together
# Write a driver script that does the following:

# Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
arr = Array.new(15) { rand(1..100) }
tree = Tree.new(arr)
puts "\n\nThe array of values: \n#{arr}"

puts "\n\nVisual printout of the tree:\n\n"
tree.pretty_print
#
# Confirm that the tree is balanced by calling #balanced?
puts "\n\nThe tree is balanced..."
puts "...#{tree.balanced?}\n"

# Print out all elements in level, pre, post, and in order
puts "\n>>>>>> Travesals <<<<<<"
puts"\n>>> Breadth fist traversal <<<"
puts"\nLevel order"
tree.level_order { |node| print "#{node.data} " }

puts"\n\n\n>>> Depth first traversals <<<"
puts"\n\nPreorder -  root, left nodes, right nodes"
tree.preorder { |node| print " #{node.data}" }

puts"\n\nPostorder - left nodes, right nodes, root"
tree.postorder { |node| print " #{node.data}" }

puts"\n\nInorder - left nodes, root, right nodes"
tree.inorder { |node| print " #{node.data}" }
puts "\n"

# Unbalance the tree by adding several numbers > 100
puts "\n\n...Behind the scenes, a few numbers greater than 100 have been added to the tree..."

5.times do
  num = rand(101...1000)
  tree.insert(num)
end

puts "\n\nVisual printout of the tree with the new nodes:\n\n"
tree.pretty_print

# Confirm that the tree is unbalanced by calling #balanced?
puts "\n\nThe tree is balanced..."
puts "...#{tree.balanced?}\n"

# Balance the tree by calling #rebalance
puts "\n\nBehind the scenes, rebalancing the tree"
tree.rebalance

# Confirm that the tree is balanced by calling #balanced?
puts "\n\nThe tree is balanced..."
puts "...#{tree.balanced?}\n"

puts "\n\nVisual printout of the rebalanced tree:\n\n"
tree.pretty_print

# Print out all elements in level, pre, post, and in order.

puts "\n>>>>>> Travesals, revisited <<<<<<"
puts"\n>>> Breadth fist traversal <<<"
puts"\nLevel order"
tree.level_order { |node| print "#{node.data} " }

puts"\n\n\n>>> Depth first traversals <<<"
puts"\n\nPreorder -  root, left nodes, right nodes"
tree.preorder { |node| print " #{node.data}" }

puts"\n\nPostorder - left nodes, right nodes, root"
tree.postorder { |node| print " #{node.data}" }

puts"\n\nInorder - left nodes, root, right nodes"
tree.inorder { |node| print " #{node.data}" }
puts "\n"
