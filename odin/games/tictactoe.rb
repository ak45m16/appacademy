#works but needs refactoring and more features (play again? and better UI)
class Board
  Player = Struct.new(:name)
  def initialize
    puts "Player 1, what is your name?"
    name1=gets.chomp
    @player1=Player.new(name1)
    puts "Player 2, what is your name?"
    name2=gets.chomp
    @player2=Player.new(name2)
    create_grid
  end
  def create_grid
    @grid=[
            [1,2,3],
            [4,5,6],
            [7,8,9]
          ]
  end
  def access
    @grid
  end
  def show
    @grid.each do |row|
      print row
      puts "\n"
    end
  end
  def play
    while true
    puts "#{@player1.name}, pick a location on the grid to place your X"
    location1=gets.chomp.to_i
    change_x(location1)
    show
    winx=check_for_win_x
    if winx=="X wins"
      puts "X wins"
      exit
    end
    puts "#{@player2.name}, pick a location on the grid to place your O"
    location2=gets.chomp.to_i
    change_o(location2)
    show
    wino=check_for_win_o
    if wino=="O wins"
      puts "O wins"
      exit
    end
    end
  end

  def change_x(input1)
    case input1
    when 1 then @grid[0][0]="X"
    when 2 then @grid[0][1]="X"
    when 3 then @grid[0][2]="X"
    when 4 then @grid[1][0]="X"
    when 5 then @grid[1][1]="X"
    when 6 then @grid[1][2]="X"
    when 7 then @grid[2][0]="X"
    when 8 then @grid[2][1]="X"
    when 9 then @grid[2][2]="X"
    else
      puts "Sorry, I didn't understand. Can you pick a number from 1-9?"
    end
  end
  def change_o(input2)
    case input2
    when 1 then @grid[0][0]="O"
    when 2 then @grid[0][1]="O"
    when 3 then @grid[0][2]="O"
    when 4 then @grid[1][0]="O"
    when 5 then @grid[1][1]="O"
    when 6 then @grid[1][2]="O"
    when 7 then @grid[2][0]="O"
    when 8 then @grid[2][1]="O"
    when 9 then @grid[2][2]="O"
    else
      puts "Sorry, I didn't understand. Can you pick a number from 1-9?"
    end
  end
  def check_for_win_x
    if @grid[0][0]=="X" && @grid[0][1]=="X" && @grid[0][2]=="X"
      return "X wins"
    elsif @grid[1][0]=="X" && @grid[1][1]=="X" && @grid[1][2]=="X"
      return "X wins"
    elsif @grid[2][0]=="X" && @grid[2][1]=="X" && @grid[2][2]=="X"
      return "X wins"
    elsif @grid[0][0]=="X" && @grid[1][0]=="X" && @grid[2][0]=="X"
      return "X wins"
    elsif @grid[0][1]=="X" && @grid[1][1]=="X" && @grid[2][1]=="X"
      return "X wins"
    elsif @grid[0][2]=="X" && @grid[1][2]=="X" && @grid[2][2]=="X"
      return "X wins"
    elsif @grid[0][0]=="X" && @grid[1][1]=="X" && @grid[2][2]=="X"
      return "X wins"
    elsif @grid[0][2]=="X" && @grid[1][1]=="X" && @grid[2][0]=="X"
      return "X wins"
    else
      puts "No winner yet- keep playing!"
    end
  end
  def check_for_win_o
    if @grid[0][0]=="O" && @grid[0][1]=="O" && @grid[0][2]=="O"
      return "O wins"
    elsif @grid[1][0]=="O" && @grid[1][1]=="O" && @grid[1][2]=="O"
      return "O wins"
    elsif @grid[2][0]=="O" && @grid[2][1]=="O" && @grid[2][2]=="O"
      return "O wins"
    elsif @grid[0][0]=="O" && @grid[1][0]=="O" && @grid[2][0]=="O"
      return "O wins"
    elsif @grid[0][1]=="O" && @grid[1][1]=="O" && @grid[2][1]=="O"
      return "O wins"
    elsif @grid[0][2]=="O" && @grid[1][2]=="O" && @grid[2][2]=="O"
      return "O wins"
    elsif @grid[0][0]=="O" && @grid[1][1]=="O" && @grid[2][2]=="O"
      return "O wins"
    elsif @grid[0][2]=="O" && @grid[1][1]=="O" && @grid[2][0]=="O"
      return "O wins"
    else
      puts "No winner yet- keep playing!"
    end
  end
end

class Player
  attr_reader :name, :color
  def initialize(name)
    @name=name
  end
end

# tictactoe=Board.new
# tictactoe.show
# tictactoe.play
