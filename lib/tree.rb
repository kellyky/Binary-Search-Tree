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

  def insert(value, node = @root)
    return unless find(value).nil?

    dir = value < node.data ? :left : :right

    if node.send(dir).nil?
      node.send("#{dir}=", Node.new(value))
    else
      insert(value, node.send(dir))
    end
  end

   def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      node.data = min_value(node.right)
      node.right = delete(node.data, node.right)
    end

    node
  end

  def min_value(node)
    current = node
    current = current.left until current.left.nil?
    current.data
  end

  # return the node with the given value
  def find(value, node = @root)
    return if node.nil?
    return node if value == node.data

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def level_order(&block)
    return if @root.nil?
    queue = [@root]

    until queue.empty?
      node = queue.shift

      block_given? ? yield(node) : (print "#{node}")

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  # Inorder >>> lefts, root, rights
  def inorder(node = @root, &block)
    return if node.nil?

    inorder(node.left, &block)
    block_given? ? yield(node) : (print "#{node}")
    inorder(node.right, &block)
  end

  # Preorder >>> root, lefts, rights
  def preorder(node = @root, &block)
    return node if node.nil?

    block_given? ? yield(node) : (print "#{node}")

    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  # Postorder >>> lefts, rights, root
  def postorder(node = @root, &block)
    return node if node.nil?

    preorder(node.left, &block)
    preorder(node.right, &block)

    block_given? ? yield(node) : (print "#{node}")
  end

  def height(node)
    return -1 if node.nil?

    left = height(node.left)
    right = height(node.right)

    [left, right].max + 1
  end

  def depth(value, sum = 0, node = @root)
    return sum if value == node.data

    dir = value < node.data ? :left : :right
    depth(value, sum + 1, node.send(dir))
  end

  def balanced?
    (height(@root.left) - height(@root.right)).abs <= 1
  end

  def rebalance
    node_values = []
    self.inorder { |node| node_values << node.data }
    @root = build_tree(node_values)
  end
end
