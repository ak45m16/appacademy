require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = {}
    @queue = BinaryMinHeap.new { |key1, key2| prc.call(@map[key1], @map[key2])}
  end

  def [](key)
    @map[key]
  end

  def []=(key, value)
    if !@map[key]
      insert(key, value)
    else
      update(key, value)
    end
  end

  def count
    @map.count
  end

  def empty?
    count == 0
  end

  def extract
    key = @queue.extract
    val = @map.delete(key)
    [key, val]
  end

  def has_key?(key)
    @map.has_key?(key)
  end

  # protected
  attr_accessor :map, :queue

  def insert(key, value)
    @map[key] = value
    @queue.push(key)
  end

  def update(key, value)
    @map[key] = value
    queue.reduce!(key)
  end
end
