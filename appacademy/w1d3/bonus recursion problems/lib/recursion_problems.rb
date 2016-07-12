#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return 0 if array.length == 0
  sum = 0
  sum += array.first + sum_recur(array[1..-1])
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array == []
  if array.first != target
    includes?(array[1..-1], target)
  else
    return true
  end
end

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.length == 0
  count = 0
  if array.first == target
    count += 1
  end
  total = num_occur(array[1..-1], target) + count
end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length < 2
  return true if array.length >=2 && array[0] + array[1] == 12
  add_to_twelve?(array[1..-1])
end

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.length < 2
  if array[0] > array[1]
    return false
  else
    sorted?(array[1..-1])
  end
end

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length <= 1
  final = string[-1] + reverse(string[0..-2])

end
