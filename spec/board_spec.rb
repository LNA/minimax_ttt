require 'spec_helper'

describe Board do
  let (:test_board) {Board.new}

  it "has nine spaces" do
    expect(test_board.spaces.count).to eq(9)
  end

  it "fills a space on a given board" do
    board = [nil] * 9
    test_board.fill(board, 0, "X")
    
    expect(board[0]).to eq("X")
  end

  it "resets the board" do
    test_board.spaces = ['X'] * 9
    test_board.reset

    expect(test_board.spaces).to eq([nil] * 9)
  end
end
