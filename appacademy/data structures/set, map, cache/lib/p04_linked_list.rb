class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
   @head.next == @tail
  end

  def get(key)
    each do |link|
      if link.key == key
        return link.val
      else
        nil
      end
    end
  end

  def include?(key)
    each do |link|
      if link.key == key
        return true
      end
    end
    return false
  end

  def append(key, val)
    new_item = Link.new(key, val)
    @tail.prev.next = new_item
    new_item.prev = @tail.prev
    new_item.next = @tail
    @tail.prev = new_item
    new_item
  end

  def update(key, val)
    each do |link|
      if link.key == key
        link.val = val
        return link
      end
    end
  end

  def remove(key)
    each do |link|
      if link.key == key
        link.prev.next = link.next
        link.next.prev = link.prev
        link.next = nil
        link.prev = nil
        return link.val
      end
    end
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
