def translate(string)
		jelly = string.split(" ")
		arr = []
		jelly.each do |word|
			if word[0].match("[aeiou]")
				arr << (word + "ay")
			elsif word[0]=="q" && word[1]=="u"
				ending = word[0]+word[1]
				rest = word[2..(word.length)]
				arr << (rest + ending + "ay")
			elsif !word[0].match("[aeiou]") && word[1]=="q" && word[2]=="u" 
				ending = word[0]+word[1]+word[2]
				rest = word[3..(word.length)]
				arr << (rest + ending + "ay")
			elsif !word[1].match("[aeiou]")
				if !word[2].match("[aeiou]")
					ending = word[0]+word[1]+word[2]
					rest = word[3..(word.length)]
					arr << (rest + ending + "ay")
				else
					ending = word[0]+word[1]
					rest = word[2..(word.length)]
					arr << (rest + ending + "ay")
				end	
			else
				ending = word[0]
				rest = word[1..(word.length)]
				arr << (rest + ending + "ay")  
			end
		end
		return arr.join(" ")
end


#orignally, had the code below for a single word at the top of this code but realized that the
#string.split(" ") still works if there is only a single word but the |word| won't
#make perfect sense for single words since in that case it should be |letter|
	
	# if string.include?(" ") == false
	# 	#if string[0].include?("a") || string[0].include?("e") || string[0].include?("i") || string[0].include?("o") || string[0].include?("u")
	# 	if string[0].match("[aeiou]")
	# 		return string + "ay"
	# 	elsif string[0]=="q" && string[1]=="u"
	# 		ending = string[0]+string[1]
	# 		rest = string[2..(string.length)]
	# 		return rest + ending + "ay"
	# 	elsif !string[0].match("[aeiou]") && string[1]=="q" && string[2]=="u" 
	# 		ending = string[0]+string[1]+string[2]
	# 		rest = string[3..(string.length)]
	# 		return rest + ending + "ay"
	# 	elsif !string[1].match("[aeiou]")
	# 		if !string[2].match("[aeiou]")
	# 			ending = string[0]+string[1]+string[2]
	# 			rest = string[3..(string.length)]
	# 			return rest + ending + "ay"
	# 		else
	# 			ending = string[0]+string[1]
	# 			rest = string[2..(string.length)]
	# 			return rest + ending + "ay"
	# 		end	
	# 	else
	# 		ending = string[0]
	# 		rest = string[1..(string.length)]
	# 		return rest + ending + "ay"  
	# 	end
	# else 