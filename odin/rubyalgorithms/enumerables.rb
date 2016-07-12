#reimplementation of enumerable methods
module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end
  def my_each_with_index
    return self unless block_given?
    i=0
    while i<self.length
      yield(self[i],i)
      i=i+1
    end
  end
  def my_select
    return self unless block_given?
    final=[]
    self.my_each do |i|
      final << i if yield(i)
    end
    final
  end
  def my_all?
    counter=0
    garbage=0
    self.my_each do |i|
      if yield(i)
        counter=counter+1
      else
        garbage=garbage+1
      end
    end
    return true if garbage==0
    return false if garbage>0
  end
  def my_any?
    counter=0
    garbage=0
    self.my_each do |i|
      if yield(i)
        counter=counter+1
      else
        garbage=garbage+1
      end
    end
    return true if counter>0
    return false if counter==0
  end
  def my_none?
    counter=0
    garbage=0
    self.my_each do |i|
      if yield(i)
        counter=counter+1
      else
        garbage=garbage+1
      end
    end
    return true if counter==0
    return false if counter>0
  end
  def my_count
    counter=0
    self.my_each do |i|
      counter=counter+1
    end
    counter
  end
  def my_map(&proc)          #accepts a block or proc
    final=[]
    self.my_each do |i|
      final << yield(i)
    end
    final
  end
  def my_inject(accum=0)
    self.my_each do |i|
      accum=yield(accum,i)
    end
    accum
  end
end
def multiply_els(arr)
    arr.my_inject(1) {|accum,i| accum*i}
end

john=[1,2,3,4,5].my_count
puts john