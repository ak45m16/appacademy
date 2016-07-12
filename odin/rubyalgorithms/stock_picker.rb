#implementation of a stock picker that, given an array of stock prices (#one for each day), returns the 2 days representing the pair of best day
#to buy and best day to sell

def stock_picker(arr)
	difference = 0
	start_index = 0
	end_index = 0
	i=0
	while i < arr.length #outer loop starts on the 1st day
		j=i+1 #increment should be 1 greater than the 1st day
		while j < arr.length #inner loop goes through all values after i day
			jelly = [arr[j], arr[i]].inject(:-) #calculate largest difference
			if jelly > difference
				difference = jelly #update values if the difference is larger
				start_index = i
				end_index = j
			end
			j=j+1
		end
		i=i+1
	end
	answer=[]
	answer << start_index
	answer << end_index
	return answer #return array of first day followed by second day
end

#test case should equal [2,6]
#stock_picker([17,3,6,9,15,8,6,1,10])
