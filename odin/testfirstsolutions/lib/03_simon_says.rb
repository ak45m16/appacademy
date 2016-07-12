def echo(string)
	return string
end

def shout(string)
	return string.upcase
end

def repeat(string, num=2)
	jelly = [string] * num
	return jelly.join(" ")
end

def start_of_word(string, num)
	jelly = string.split("")
	return jelly[0..(num-1)].join("")
end

def first_word(string)
	return string.split(" ").first
end

def titleize(string)
	if string.include?(" ") == false
		return string.capitalize 
	end
	jelly = string.split(" ")
	little_words = ["and", "over", "the"]
	jelly.each do |word|
		word.capitalize! if little_words.include?(word) == false 
	end
	jelly.first.capitalize!
	return jelly.join(" ")
end


