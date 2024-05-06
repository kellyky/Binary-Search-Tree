# frozen_string_literal: true

# require_relative 'node'
require 'pry-byebug'

# Creating the tree (built of nodes) - binary search tree
class Tree
  attr_accessor :root

  def initialize(arr)
    scrubbed_and_sorted_arr = arr.uniq.sort
    @root = build_tree(scrubbed_and_sorted_arr)
  end

  def build_tree(arr)
    return if arr.empty?
    return Node.new(arr[-1]) if arr.length == 1

    middle_index = arr.length / 2
    root = arr[middle_index]
    node = Node.new(root)

    left_subarr = arr.slice(0...middle_index)
    node.left = build_tree(left_subarr)

    right_subarr = arr.slice(1 + middle_index..-1)
    node.right = build_tree(right_subarr)

    node
  end

  # # method provided / borrowed
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
