class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    
    pivot = array[0]
    left_arr = []
    right_arr = []
    
    array.each do |el|
      if el < pivot
        left_arr << el
      elsif el > pivot
        right_arr << el
      end
    end
    
    sort1(left_arr) + [pivot] + sort1(right_arr)
    
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if array.length < 2
    
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    
    partition_index = partition(array, start, length, &prc)

    sort2!(array, start, partition_index - 1, &prc)
    sort2!(array, partition_index + 1, array.length, &prc)
    
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    partition_index = start
    pivot = array[start]
    ((start)..(length)).each do |idx|
      current_el = array[idx]
      if (idx != start && prc.call(pivot, current_el) != -1 )
        array[idx] = array[partition_index + 1]
        array[partition_index + 1] = current_el
        partition_index += 1
      end
    end
    pivot, array[partition_index] = array[partition_index], pivot
    partition_index
  end
end

# array = [4, 3, 10, 7, 2, 8, 1]
# puts QuickSort.partition(array, 0, array.length)
# puts QuickSort.sort2!(array, 0, array.length)
