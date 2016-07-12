#implementation of bubble sort
def bubble_sort(arr)
	loop do
		switched = false
		(arr.count-1).times do |i|
			if arr[i]>arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				switched = true
			end
		end
		break if not switched
	end
	arr
end

#bubble sort that also accepts a block
def bubble_sort_by(arr)
	loop do
		switched = false
		(arr.count-1).times do |i|
			if yield(arr[i],arr[i+1])<0
				arr[i],arr[i+1]=arr[i+1], arr[i]
			end
		end
		break if not switched
	end
	arr
end

