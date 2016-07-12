#does not have option to save game yet
require 'yaml'

class Board
  def initialize
    text=File.readlines("5desk.txt")
    secret_word_up=text[rand(1..61406)].chomp
    @secret_word=secret_word_up.downcase
    @new_game="_"*@secret_word.length
  end
  def show
    @new_game
  end
  def secret
    @secret_word
  end
  def win
    if @new_game==@secret_word
      return true
    end
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name=name
  end
end
puts "Would you like to load a saved game? Yes or No?"
answer=gets.chomp
if answer=="Yes" || answer=="yes"
  input=File.new('save.yml','r')
  human,i,word,board= YAML.load(input.read)
  input.close
else
  puts "Human, what is your name?"
  name=gets.chomp
  human=Player.new(name)
  hangman=Board.new
  board=hangman.show
  puts board
  puts "Ok, #{name}, I have chosen the secret word."
  i=7
  incorrect_letters=[]
  word=hangman.secret
  puts word
end

while true
  puts "Would you like save the current game and quit? Yes or No?"
  choice=gets.chomp
  if choice=="Yes" || choice=="yes"
    save_data=[human,i,word,board]
    output=File.new('save.yml','w')
    output.puts YAML.dump(save_data)
    output.close
    break
  end
  puts "You have #{i} incorrect guesses left. Start guessing letters!"
  letter_up=gets.chomp
  letter=letter_up.downcase
  if word.include?(letter)
    puts "Correct"
    indices=(0..word.length).find_all{|i| word[i]==letter}
    indices.each {|index| board[index]=letter}
    puts board
  else
    i=i-1
    incorrect_letters << letter
    puts "Wrong! You have #{i} incorrect guesses left"
    puts "Incorrect letters: #{incorrect_letters}"
  end
  break if i==0
  break if hangman.win
end
