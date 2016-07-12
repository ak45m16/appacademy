class Game
  attr_accessor :fragment

  LOSSES = {1 => "G", 2 => "H", 3 => "O", 4 => "S", 5 => "T"}

  def initialize
    @fragment = ""
    @dictionary = File.readlines("ghost-dictionary.txt")
  end

  def change(val)
    @fragment << val
  end

  def valid_play?(string)
    if ("a".."z").to_a.include?(string)
      return true
    else
      return false
    end
  end

  def p1_loss(player1)
    @dictionary.each do |word|
        if word.chomp == @fragment.chomp
          player1.losses += 1
          player1.standing += LOSSES[player1.losses]
          "You lose! #{player1.name} has #{player1.losses} losses and has a record of #{player1.standing}"
          return "You lose!"
        end
    end
  end

  def p2_loss(player2)
    @dictionary.each do |word|
        if word.chomp == @fragment.chomp
          player2.losses += 1
          player2.standing += LOSSES[player2.losses]
          "You lose! #{player2.name} has #{player2.losses} losses and has a record of #{player2.standing}"
          return "You lose!"
        end
    end
  end

  def change_if_valid(letter)
    if valid_play?(letter)
        change(letter)
        puts "Success, the fragment is now #{@fragment}."
    else
        puts "Invalid letter."
    end
  end

  def run(player1, player2)
    loop do
      puts "#{player1.name} pick a letter"
      letter1 = gets.chomp

      change_if_valid(letter1)

      if p1_loss(player1) == "You lose!"
        display_stats(player1,player2)
        @fragment = ""
      end

      puts "#{player2.name} pick a letter"
      letter2 = gets.chomp

      change_if_valid(letter2)

      if p2_loss(player2) == "You lose!"
        display_stats(player1,player2)
        @fragment = ""
      end
    end
  end

  def play(player1, player2)
    until player1.standing == "GHOST" || player2.standing == "GHOST"
      run(player1, player2)
    end
  end


  def display_stats(player1, player2)
    p "player1"
    p player1.losses
    p player1.standing
    p "player2"
    p player2.losses
    p player2.standing
  end

end

class Player
  attr_accessor :name, :losses, :standing
  def initialize(name)
    @name = name
    @losses = 0
    @standing = ""
  end
end


ghost = Game.new
player1 = Player.new("john")
player2 = Player.new("jake")
ghost.play(player1, player2)