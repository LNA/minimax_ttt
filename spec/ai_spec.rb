require 'spec_helper'

describe AI do
  let (:game_rules) {GameRules.new}
  let (:board)      {Board.new}

  before :each do
    @ai = AI.new(game_rules)
  end

  context 'first move' do 
    it 'playes 0 if the board is empty' do 
      board.spaces = [nil] * 9

      @ai.find_best_move(board, 'X', 'O').should == 0
    end

    it 'plays 0 if the opponents first move was the center space' do 
      board.spaces    = [nil] * 9
      board.spaces[4] = 'X'

      @ai.find_best_move(board, 'X', 'O').should == 0 
    end

    it 'plays 4 if the opponents first move was 0' do 
      board.spaces    = [nil] * 9
      board.spaces[0] = 'X'

      @ai.find_best_move(board, 'X', 'O').should == 4
    end
  end

  context '#find_best_move' do
    it 'plays the last open move' do
      board.spaces = ['X', 'O', 'O',
                      'X', 'O', 'X',
                      'O', nil, 'O']

      @ai.find_best_move(board, 'X', 'O').should == 7
    end

    it 'blocks the doubble set up' do
      board.spaces = [nil] * 9
      board.spaces[0] = 'O'
      board.spaces[4] = 'X'
      board.spaces[8] = 'X'

      acceptable_moves = [1, 2, 6]
      move = @ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the top left corner set up" do
      board.spaces = [nil] * 9
      board.spaces[1] = 'X'
      board.spaces[3] = 'X'
      board.spaces[4] = 'O'
      acceptable_moves = [0, 2]
      move = @ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the top right corner set up" do
      board.spaces = [nil] * 9
      board.spaces[1] = 'X'
      board.spaces[5] = 'X'
      board.spaces[4] = 'O'

      acceptable_moves = [0, 2]
      move = @ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the bottom left corner set up" do
      board.spaces = [nil] * 9
      board.spaces[7] = 'X'
      board.spaces[3] = 'X'
      board.spaces[4] = 'O'

      acceptable_moves = [0, 6]
      move = @ai.find_best_move(board, 'X', 'O')
      acceptable_moves.should include(move)
    end

    it "blocks the bottom right corner set up" do
      board.spaces = [nil] * 9
      board.spaces[5] = 'X'
      board.spaces[7] = 'X'
      board.spaces[4] = 'O'

      acceptable_moves = [0, 6]
      move = @ai.find_best_move(board, 'X', 'O')
      acceptable_moves.should include(move)
    end

    it 'chooses a corner or center as opening move' do
      board.spaces = [nil] * 9
      move = @ai.find_best_move(board, 'X', 'O')

      move.should be_even
    end
  end
end
