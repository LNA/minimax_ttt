require 'spec_helper'

describe GameRules do 
  let (:game_rules)  {GameRules.new}
  let (:board)       {[nil] * 9}

  context "#valid_move?" do
    it "returns true for a valid move" do 
      game_rules.valid?(board, 0).should == true
    end

    it "returns false for a move of 100" do 
      game_rules.valid?(board, 100).should == false
    end

    it "returns false for a taken space" do 
      board[0] = 'X'

      game_rules.valid?(board, 0).should == false
    end
  end

  context "#full?" do 
    it "returns false for a board that is not full" do
      board = [nil] * 9

      game_rules.full?(board).should == false
    end

    it "returns true for a full board" do 
      board = ["X"]*9

      game_rules.full?(board).should == true
    end
  end 

  context "#tie?" do 
    it 'returns true in the case of a tie' do 
      board[0] = 'X'
      board[1] = 'X'
      board[2] = 'O'
      board[3] = 'O'
      board[4] = 'O'
      board[5] = 'X'
      board[6] = 'X'
      board[7] = 'X'
      board[8] = 'O'

      game_rules.tie?(board).should == true
    end

    it 'returns false in the case of a win' do 
      board = ["X"] * 9

      game_rules.tie?(board).should == false
    end

    it 'returns false in the case of an empty board' do
      board = [nil] * 9

      game_rules.tie?(board).should == false
    end
  end

  context "#game_over?" do 
    it "returns true for a full board" do 
      board = ["X"]*9

      game_rules.game_over?(board).should == true
    end

    it "returns false if the game is not over" do  
      board = [nil] * 9
          
      game_rules.game_over?(board).should == false
    end

    it "returns true if there is a winner" do 
      board = ["X"] * 9 
      game_rules.game_over?(board).should == true
    end
  end

  context "#winner" do 
    it "returns the winner on a full board" do 
      board = ['X'] * 9

      game_rules.winner(board).should == "X"
    end

    it "returns the winner on a partially full board" do 
      board[0] = 'X'
      board[3] = 'X'
      board[6] = 'X'

      game_rules.winner(board).should == 'X'
    end

    it "returns the false if there is no winner" do 
      board = [nil] * 9

      game_rules.winner(board).should == false
    end

    it "returns false in the case of a tie" do 
      board[0] = 'X'
      board[1] = 'X'
      board[2] = 'O'
      board[3] = 'O'
      board[4] = 'O'
      board[5] = 'X'
      board[6] = 'X'
      board[7] = 'X'
      board[8] = 'O'

      game_rules.winner(board).should == false
    end
  end
end