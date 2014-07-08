class Board
  attr_accessor :spaces, :open_spaces, :fill

  def initialize
    @spaces = [nil] * 9
  end

  def fill(board, move, mark)
    board[move.to_i] = mark
  end

  def reset
    @spaces = [nil] * 9
  end
end
