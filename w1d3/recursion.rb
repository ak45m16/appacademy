require 'byebug'

def range(start,finish)
  return [] if finish < start

  arr = range(start, finish - 1)
  arr << finish
end

def iterative_sum(arr)
  total = 0
  i = 0
  while i < arr.length
    total += arr[i]
    i += 1
  end
  total
end

def sum(arr)
  return arr.first if arr.length == 1

  total = arr.first + sum(arr.drop(1))
  # arr.last + sum(arr[0...-1])
  total
end

##EXPONENTIATION
def exp_1(b, n)
  return 1 if n == 0

  total = b * exp_1(b,n-1)
end

def exp_2(b, n)
  return 1 if n == 0

  if n.even?
    total = exp_2(b, n/2)
    total * total
  elsif n.odd?
    total = exp_2(b, (n-1)/2)
    b * total * total
  end
end

class Array
  def deep_dup
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end
  end

  def deep_dup_2
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end
end

def fib_it(n)
  arr = [0,1]
  i = 0
  while i < (n - 2)
    arr << arr[-1]+ arr[-2]
    i += 1
  end
  arr
end

def fib_rec(n)
  return [0, 1] if n == 2

  fibs = fib_rec(n-1)
  fibs << fibs.last + fibs[-2]
end

def bsearch(array, target)
    mid_index = array.length/2
    return mid_index if array[mid_index] == target

    if target < array[mid_index]
      bsearch((array[0]..array[mid_index - 1]).to_a, target)
    elsif target > array[mid_index]
      mid_index + 1 + bsearch((array[mid_index + 1]..array[-1]).to_a, target)
    end
end

# def make_change(amount, coins)
#   return coins if amount == 0

#   coin = coins.shift
#   variables = amount.divmod(coin)
#   variables[0].times { coins << coin }
#   amount = variables[1]
#   make_change(amount, coins)
# end

# def make_change_again(amount, coins)
#   best_coins = []
#   dup_coins = coins.dup
#   until coins.length == 1

#     return coins if amount == 0
#     best_coins = []

#     coin = coins.shift
#     variables = amount.divmod(coin)
#     variables[0].times { coins << coin }
#     amount = variables[1]
#     new_coins = make_change_again(amount, coins)

#     if new_coins.length < best_coins.length
#       best_coins = new_coins
#     else
#       best_coins = best_coins
#     end

#     best_coins
#   end
# end




def make_change(amount, coins)
  best_change = nil
  return [] if amount == 0

  coins.each_with_index do |el, i|
    if el <= amount
      remainder = amount - el
      new_change = make_change(remainder, coins) + [el]
      if best_change.nil? || best_change.length > new_change.length
        best_change = new_change
      end
    end
  end
  best_change
end

# def merge_sort(arr)
#   return arr if arr.count == 0 || arr.count == 1
#   arr1 = arr[0..(arr.length/2)]
#   arr2 = arr[(arr.length/2)+1..-1]
#   merge_sort(arr.length/2
#   merge(arr1, arr2)
# end

def mergesort(arr)
  return arr if arr.length < 2

  left_merged_stuff = mergesort(arr[0..((arr.length/2)-1)])
  right_merged_stuff = mergesort(arr[(arr.length/2)..-1])
  merge(left_merged_stuff, right_merged_stuff)
end

def merge(left, right)
  merged_arr = []
  until left.length == 0 || right.length == 0
    if left.first > right.first
      merged_arr << right.shift
    else
      merged_arr << left.shift
    end
  end
  merged_arr + left + right
end

def subsets(arr)
  return [[]] if arr.length == 0

  subset = subsets(arr[0...-1])
  subset2 = subset.map {|el| el.dup << arr.last}

  subset + subset2
end


