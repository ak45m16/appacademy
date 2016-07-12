def reverser
	jelly = yield.split(" ")
	jelly.each do |word|
		word.reverse!
	end
 	return jelly.join(" ")
end

def adder(n=1)
	return yield + n
end

def repeater(x=0)
 	n=0
 	if x==0
		return yield
	else
		x.times do
			yield
		end
	end
end



