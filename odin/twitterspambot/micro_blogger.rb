require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client=JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <=140
      @client.update(message)
    else
      "The message needs to be under 140 characters. Try again."
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include?(target)
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "You can only DM people who follow you! Try someone else."
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    screen_names
  end

  def spam_my_followers(message)
    followers=followers_list
    followers.each do |follower|
      dm(follower,message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends
    sorted = friends.sort_by {|friend| friend.screen_name.downcase}
    sorted.each do |friend|
      timestamp = friend.status.created_at
      print friend.screen_name
      print friend.status.text
      print timestamp.strftime("%A, %b %d")
      puts ""  # Just print a blank line to separate people
    end
  end

  def shorten(original_url)
    puts "Shortening this URL: #{original_url}"
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    return bitly.shorten(original_url).short_url
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1], parts[2..-1].join(" "))
        when 'elt' then everyones_last_tweet
        when 'shorten' then shorten(parts[1..-1].join(" "))
        when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end

end

blogger = MicroBlogger.new
blogger.run
