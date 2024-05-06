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

    mid = arr.length / 2
    root = arr[mid]
    node = Node.new(root)

    node.left = build_tree(arr.slice(0...mid))
    node.right = build_tree(arr.slice(1 + mid..-1))

    node
  end

  # method provided / borrowed & adapted
  def pretty_print(node = @root, subtree = :left, prefix = '')
    connector = subtree == :left ? '└── ' : '┌── '
    new_prefix = "#{prefix}#{subtree == :left ? '    ' : '│   '}"

    pretty_print(node.right, :right, "#{prefix}#{subtree == :left ? '│   ' : '    '}") if node.right

    puts "#{prefix}#{connector}#{node.data}"

    pretty_print(node.left, :left, new_prefix) if node.left
  end

  # Is this working correctly?
  def insert(value, node = @root)
    if value < node.data
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(value, node.left)
      end
    else
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(value, node.right)
      end
    end
  end

  def delete(value)
  #   # delete a node with this value
  #   # # how to handle if the node has children vs not?
  end

  # return the node with the given value
  def find(value, node = @root)
    return node.data if value == node.data

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

end
