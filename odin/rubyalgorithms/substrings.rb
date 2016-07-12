#implementation that takes a word as the first argument and a array of substrings as the second #argument and then computes a hash listing of each substring (case insensitive) that was found in #the original word and its frequency

def substrings(phrase, arr)
  counter=Hash.new(0)
  words=phrase.split(" ") #split phrases into words
  words.each do |word|
    arr.each do |substring|
      if word.downcase.match(substring) #check to see if the word is matched by any/every substring
      counter[substring]=counter[substring]+1 #use a hash as the counter
      end
    end
  end
  counter
end

#test case; result should be {"below"=>1, "low"=>1}
#substrings("below",["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])
