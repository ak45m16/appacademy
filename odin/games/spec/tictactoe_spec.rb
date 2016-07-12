#check for wins, losses, and method functionality after refactoring the game
require './spec_helper'

describe Board do
  context "new game" do
    it "returns a clean board" do
      @board = Board.new
      @board.access.should == [
                                [1,2,3],
                                [4,5,6],
                                [7,8,9]
                              ]
    end
  end
  context "changes grid" do
    it "changes clean grid to marked grid" do
      @board = Board.new
      @board.change_o(1)
      @board.access.should == [
                                ["O",2,3],
                                [4,5,6],
                                [7,8,9]
                              ]
    end
  end
  context "wins" do
    it "should win horizontally" do
      @board = Board.new
      @board.change_x(1)
      @board.change_x(2)
      @board.change_x(3)
      @board.check_for_win_x.should == "X wins"
    end
    it "should win vertically" do
      @board = Board.new
      @board.change_x(1)
      @board.change_x(4)
      @board.change_x(7)
      @board.check_for_win_x.should == "X wins"
    end
    it "should win diagonally" do
      @board = Board.new
      @board.change_x(1)
      @board.change_x(5)
      @board.change_x(9)
      @board.check_for_win_x.should == "X wins"
    end
  end
end