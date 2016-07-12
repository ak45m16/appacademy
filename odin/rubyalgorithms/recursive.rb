#iteration solution for fibonacci
def fibs(n)
  arr=[1,2]
  if n==2
    p fib
  elsif n==1
    p fib=1
  end
  until arr.length >= n
    sum= arr[-1]+arr[-2]
    arr << sum
  end
  arr
end

#recursive solution for fibonacci
def fibs_rec(n, arr=[1,2])
  return [1] if n==1
  return arr if n==2
  arr << arr[-1]+arr[-2]
  fibs_rec(n-1, arr)
end

#recursive solution to merge sort
def merge_sort(arr, final=[])
  if arr.length >1
    left=arr[0..arr.length/2-1].sort
    right=arr[arr.length/2..-1].sort
    left_over=[]
    if left[0] < right[0]
      final<<left[0]
      left_over= left[1..-1]+right
    elsif left[0] > right[0]
      final<<right[0]
      left_over= right[1..-1]+first
    end
    merge_sort(left_over, final)
  else
    final << arr[0]
    final
  end
end