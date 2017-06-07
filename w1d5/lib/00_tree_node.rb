require 'byebug'
class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent= (new_parent)
    old_parent = @parent
    unless old_parent.nil?
      old_parent.children.reject! {|child| child == self}
    end
    @parent = new_parent
    unless new_parent.nil?
      new_parent.children << self unless new_parent.children.include?(self)
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(new_child)
    new_child.parent = nil
    raise "Node is not a child" unless new_child.parent == self
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      val = child.dfs(target_value)
      return val unless val.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target_value
      el.children.each do |child|
        queue << child
      end
    end
    nil
  end

end

# node2 = PolyTreeNode.new(2)
# node3 = PolyTreeNode.new(3)
#
# node1 = PolyTreeNode.new(1)
#
# node2.parent = node1
# node3.parent = node1
#
# node2.parent = nil
