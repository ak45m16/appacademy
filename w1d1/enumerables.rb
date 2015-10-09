class Enumerables

  def my_each
  # def my_each(&blk)
    for i in 0...self.length
      # blk.call(self[i])
      yield self[i]
    end
    return self
  end

  def my_select
    arr = []
    self.my_each do |el|
      # arr << el if yield(el)
      if yield(el)
        arr << el
      end
    end
    arr
  end

  def my_reject
    arr = []
    self.my_each do |el|
      unless yield(el)
        arr << el
      end
    end
    arr
  end

  def my_any?
    self.my_each do |el|
      if yield(el)
        return true
      end
    end
    false
  end

  def my_all?
    self.my_each do |el|
      unless yield(el)
        return false
      end
    end
    true
  end

end


class Array

  def my_flatten
    arr = []
    self.each do |el|
      if el.class == Array
      # if el.is_a?(Array)
        # el.concat(el.my_flatten)
        el.my_flatten.each do |el1|
          arr << el1
        end
      else
        arr << el
      end
    end
    arr
  end

  def my_zip(*arg)
    arr = []
    self.each_with_index do |el,in1|
      arr2 = [self[in1]]
      # arr2 << self[in1]
      arg.each_with_index do |eli,in2|
        arr2 << arg[in2][in1]
      end
      arr << arr2
    end
    arr
  end

  def my_rotate(val=1)
    y = val % self.length
    arr = []
    self.each_with_index do |el, i|
      arr << self[-self.length + y + i]
    end
    arr
  end

  def my_join(sep="")
    rstr = ""
    self.each do |el|
      rstr += el + sep
    end

    rstr[0...-1]
  end

  def my_reverse
    # reversed = []
    rarr = []
    self.each_with_index do |el, i|
      rarr << self[-1-i]
    end
    rarr
  end
end
