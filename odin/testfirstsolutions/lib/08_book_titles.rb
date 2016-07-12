class Book
  # TODO: your code goes here!
  def title=(new_title)
  	@title = new_title
  end

  def title
  	jelly = @title.split(" ")
  	stop_words = ["the", "an", "a", "and", "in", "of"]
  	jelly.each do |word| 
  		word.capitalize! if !stop_words.include?(word) 
  	end
  	jelly.first.capitalize!
  	return jelly.join(" ")
  end

end