require 'set'

class WordChainer
    def initialize(dic_file_name)
      @dictionary = File.readlines(dic_file_name).map(&:chomp).to_set
    end

    def adjacent_words(word)
      alph = ("a".."z").to_a

      to_return = []
      word.split("").each_index do |index|
        beg = word[0...index]
        fin = word[index+1..-1]
        alph.each do |lett|
          new_word = beg + lett + fin
          next if word == new_word
          to_return << new_word if @dictionary.include?(new_word)
        end
      end

      to_return.sort
    end

    def run(source, target)
      @current_words = [source]
      @all_seen_words = {source => nil}

      until @current_words.empty?
        explore_current_words
        if @all_seen_words.keys.include?(target)
          puts "Solution found!"
          build_path(target)
          return
        end
      end
      puts "No solution found :("
    end

    def explore_current_words
      new_current_words = []
      @current_words.each do |word|
        adjacent_words(word).each do |nearby_word|
          if !@all_seen_words.keys.include?(nearby_word)
            new_current_words << nearby_word
            @all_seen_words[nearby_word] = word
          end
        end
      end
      puts new_current_words
      @current_words = new_current_words
    end

    def build_path(target)
      unless @all_seen_words[target].nil?
        build_path(@all_seen_words[target])
      end
      puts target
      
      #backwards Solution
      # until target.nil?
      #   puts target
      #   target = @all_seen_words[target]
      # end
    end





end

game = WordChainer.new("dictionary.txt").run("dark","glad")
nil
