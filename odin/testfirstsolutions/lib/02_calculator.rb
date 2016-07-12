def add(num1, num2)
	total = num1 + num2
	return total
end

def subtract(num1, num2)
	total = num1 - num2
	return total
end

def sum(arr)
	sum = 0
	arr.each do |i|
		sum += i
	end
	return sum
end

def multiply(*num)
	total = 1
	num.each do |i|
		total *= i
	end
	return total
end

def power(num1, num2)
	power = num1**num2
	return power
end

def factorial(num)
	if num == 0
		return 1
	end
	num * factorial(num-1)
end

