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

  def p_loss(player)
    @dictionary.each do |word|
        if word.chomp == @fragment.chomp
          player.losses += 1
          player.standing += LOSSES[player.losses]
          "You lose! #{player.name} has #{player.losses} losses and has a record of #{player.standing}"
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

  def run(*player)
    loop do
      puts "#{player[0].name} pick a letter"
      letter1 = gets.chomp

      change_if_valid(letter1)

      if p_loss(player[0]) == "You lose!"
        display_stats(player[0],player[1])
        @fragment = ""
      end

      puts "#{player[1].name} pick a letter"
      letter2 = gets.chomp

      change_if_valid(letter2)

      if p_loss(player[1]) == "You lose!"
        display_stats(player[0],player[1])
        @fragment = ""
      end
    end
  end

  def play(*player)
    until player[0].standing == "GHOST" || player[1].standing == "GHOST"
      run(*player)
    end
    #can you add delete player here with iterator?
  end


  def display_stats(*player)
    p "player1"
    p player[0].losses
    p player[0].standing
    p "player2"
    p player[1].losses
    p player[1].standing
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