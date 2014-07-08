require 'spec_helper'

describe AI do
  let (:game_rules) {GameRules.new}
  let (:ai)         { AI.new(game_rules)}

  context '#open_spaces' do 
    it "counts a boards open spaces" do 
      board = [nil] * 9
      board[1] = 'X'

      ai.open_spaces_on(board).should == [0, 2, 3, 4, 5, 6, 7, 8]
    end
  end

  context 'first move' do 
    it 'playes 0 if the board is empty' do 
      board = [nil] * 9

      ai.find_best_move(board, 'X', 'O').should == 4
    end

    it 'plays 0 if the opponents first move was the center space' do 
      board = [nil] * 9
      board[4] = 'X'

      ai.find_best_move(board, 'X', 'O').should == 0 
    end
  end

  context '#find_best_move' do
    it 'plays the last open move' do
      board = ['X', 'O', 'O',
               'X', 'O', 'X',
               'O', nil, 'O']

      ai.find_best_move(board, 'X', 'O').should == 7
    end

    it 'blocks the doubble set up' do
      board = [nil] * 9
      board[0] = 'O'
      board[4] = 'X'
      board[8] = 'X'

      acceptable_moves = [1, 2, 6]
      move = ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the top left corner set up" do
      board = [nil] * 9
      board[1] = 'X'
      board[3] = 'X'
      board[4] = 'O'
      acceptable_moves = [0, 2]
      move = ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the top right corner set up" do
      board = [nil] * 9
      board[1] = 'X'
      board[5] = 'X'
      board[4] = 'O'

      acceptable_moves = [0, 2]
      move = ai.find_best_move(board, 'X', 'O')

      acceptable_moves.should include(move)
    end

    it "blocks the bottom left corner set up" do
      board = [nil] * 9
      board[7] = 'X'
      board[3] = 'X'
      board[4] = 'O'

      acceptable_moves = [0, 6]
      move = ai.find_best_move(board, 'X', 'O')
      acceptable_moves.should include(move)
    end

    it "blocks the bottom right corner set up" do
      board = [nil] * 9
      board[5] = 'X'
      board[7] = 'X'
      board[4] = 'O'

      acceptable_moves = [0, 6]
      move = ai.find_best_move(board, 'X', 'O')
      acceptable_moves.should include(move)
    end
  end
end