# frozen_string_literal: true

require 'pry-byebug'

# Creating individual nodes for the tree
class Node
  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end
end
