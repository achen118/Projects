require 'colorize'
require_relative "board"
require_relative "cursor"

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, yidx|
      print "\n"
      row.each_with_index do |piece, xidx|
        str = ""
        if piece == nil
          str = ' - '
        else
          str = piece.to_s
        end
        if @cursor.cursor_pos == [xidx, yidx]
          if @cursor.selected
            print str.colorize(:color => :red, :background => :blue)
          else
            print str.colorize(:color => :blue, :background => :red)
          end
        else
          print str
        end
      end
    end
    print "\n"
  end

  def try_cursor
    while true
      render
      @cursor.get_input
    end
  end

end

board = Board.new
display = Display.new(board)
display.try_cursor
