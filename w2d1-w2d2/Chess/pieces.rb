class Piece

  def initialize
    @board = board
    @pos = pos
  end

  def to_s
    return " P "
  end

end


class NullPiece < Piece
  include Singleton

  attr_reader :value

  def initialize
    @value = nil
  end

end

module SlidingPiece

  DIAGONAL_DIRS = [
    [1, -1],
    [1, 1],
    [-1, -1],
    [-1, 1]
  ]

  HORT_VERT_DIRS = [
    [0, -1],
    [0, 1],
    [1, 0],
    [-1, 0]
  ]

  def moves

  end

end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    DIAGONAL_DIRS
  end

end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    HORT_VERT_DIRS
  end

end

class Queen < Piece
  include SlidingPiece

  def move_dirs
    DIAGONAL_DIRS + HORT_VERT_DIRS
  end

end

module SteppingPiece

  def moves

  end

end

class Knight < Piece
  include SteppingPiece

end

class King < Piece
  include SteppingPiece

end

class Pawn < Piece

end
