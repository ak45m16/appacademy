class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |item, i|
      sum += (item * i) if item.is_a?(Fixnum)
    end
    sum.hash
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |char, i|
      sum += (char.ord * i)
    end
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |key, val|
      sum += (key.to_s.ord + val.ord)
    end
    sum.hash
  end
end
