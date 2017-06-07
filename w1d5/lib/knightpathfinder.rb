require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

  MOVESET = [
    [-2, -1],
    [-2, 1],
    [2, -1],
    [2, 1],
    [-1, -2],
    [1, -2],
    [1, 2],
    [-1, 2]
  ]

  attr_accessor :pos, :grid, :visited_positions, :move_tree



  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
    @grid = Array.new(8) { Array.new(8) }
    @move_tree = build_move_tree
  end

  def valid_move?(pos)
    unless @visited_positions.include?(pos)
      if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        return true
      end
    end
    false
  end

  def valid_moves(starting_pos)
    possible_moves = []
    MOVESET.each do |move|
      new_pos = []
      new_pos[0] = starting_pos[0] + move[0]
      new_pos[1] = starting_pos[1] + move[1]
      possible_moves << new_pos if valid_move?(new_pos)
    end
    @visited_positions += possible_moves
    byebug
    possible_moves
  end

  def build_move_tree
    queue = [PolyTreeNode.new(pos)]
    results = []
    until queue.empty?
      curr_node = queue.shift
      valid_moves(curr_node.value).each do |move|
        new_node = PolyTreeNode.new(move)
        results << new_node
        curr_node.add_child(new_node)
        queue += [new_node]
      end
    end
    results
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def find_path(end_pos)
    return p "You're already there!" if end_pos == pos
    self.move_tree[0].dfs(end_pos)
  end

  def trace_path_back(end_node)
    if end_node.parent.nil?
      return [end_node.value]
    end
    results = trace_path_back(end_node.parent)
    results << [end_node.value]
  end

end

knight = KnightPathFinder.new([0, 0])
node = knight.find_path([1,2])
p knight.trace_path_back(node)
