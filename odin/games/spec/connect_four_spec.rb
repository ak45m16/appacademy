require './spec_helper'

describe Board do
  context "new game" do
    it "returns a clean board" do
      @board = Board.new
      @board.access.should == [[0.0,0.1,0.2,0.3,0.4,0.5,0.6],
                               [1.0,1.1,1.2,1.3,1.4,1.5,1.6],
                               [2.0,2.1,2.2,2.3,2.4,2.5,2.6],
                               [3.0,3.1,3.2,3.3,3.4,3.5,3.6],
                               [4.0,4.1,4.2,4.3,4.4,4.5,4.6],
                               [5.0,5.1,5.2,5.3,5.4,5.5,5.6]]
    end
  end
  context "changes grid" do
    it "changes clean grid to marked grid" do
      @board = Board.new
      @board.change_r(0,0)
      @board.access.should == [["R",0.1,0.2,0.3,0.4,0.5,0.6],
                               [1.0,1.1,1.2,1.3,1.4,1.5,1.6],
                               [2.0,2.1,2.2,2.3,2.4,2.5,2.6],
                               [3.0,3.1,3.2,3.3,3.4,3.5,3.6],
                               [4.0,4.1,4.2,4.3,4.4,4.5,4.6],
                               [5.0,5.1,5.2,5.3,5.4,5.5,5.6]]
    end
  end
  context "wins" do
    it "should win horizontally" do
      @board = Board.new
      @board.change_r(0,0)
      @board.change_r(0,1)
      @board.change_r(0,2)
      @board.change_r(0,3)
      @board.row_check_for_win_r.should == true
    end
    it "should win vertically" do
      @board = Board.new
      @board.change_r(0,0)
      @board.change_r(1,0)
      @board.change_r(2,0)
      @board.change_r(3,0)
      @board.col_check_for_win_r.should == true
    end
    it "should win diagonally" do
      @board = Board.new
      @board.change_r(0,0)
      @board.change_r(1,1)
      @board.change_r(2,2)
      @board.change_r(3,3)
      @board.check_for_diagonals_r.should == "R wins!"
    end
  end
end