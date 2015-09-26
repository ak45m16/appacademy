def bsearch(arr, target)
  if arr.length < 2
    return 0 if arr[0] == target
    return nil
  end

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  if target < arr[mid]
    bsearch(left, target)
  else
    right_index = bsearch(right, target)
    return left.length + right_index if right_index
  end
end
