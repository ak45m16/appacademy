#works but needs refactoring

class Board
  def initialize
    @new_game = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
    puts "Human, what is your name?"
    name1 = gets.chomp
    codebreaker = Player.new(name1)
    puts "Ok, #{name1}, I have chosen the 4 pegs (each peg color is denoted by integers 1-6)"
    puts "#{@new_game}"
  end

  def play
    12.times do |game|
      puts "Please enter your guess as to what the 4 pegs are in a 1,2,3,4 format! You have #{12-game} tries left."
      input = gets.chomp
      guess = input.split(",").map { |s| s.to_i }

      if guess == @new_game
        puts "Correct!"
        exit
      end

      arr = [":(", ":(", ":(", ":("]
      4.times do |i|
        if guess[i] == @new_game[i]
          arr[i] = ":)"
        end
      end

      4.times do |j|
        if guess[j] != @new_game[j] && @new_game.include?(guess[j]) && arr[@new_game.index(guess[j])] != ":)"
          arr[j] = ":/"
        end
      end
      print arr
    end
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name=name
  end
end


mastermind = Board.new
mastermind.play






