require_relative 'heap'

class HuffmanNode
  include Comparable
  attr_reader :letters, :count

  def initialize(letters, count, zero_child=nil, one_child=nil)
    # letters should be an array of the letter(s) this node represents
    @letters = Array(letters)
    # count should be the combined number of instances of these letter(s)
    @zero_child = zero_child
    @one_child = one_child
    @count = count
  end

  def <=>(other_huffman_node)
    if count < other_huffman_node.count
      -1
    elsif count == other_huffman_node.count
      0
    else
      1
    end
  end

  def combine(other_huffman_node)
    HuffmanNode.new(letters + other_huffman_node.letters, count + other_huffman_node.count, self, other_huffman_node)
  end

  def inspect
    "#{@letters} => #{@count}"
  end
end

class HuffmanCode < String
  attr_accessor :codes
  def initialize(*args)
    @codes = Hash.new { "" }
    super(*args)
  end

  def encode!
    #fail
    # should turn this into a Huffman Code (and store the code in an ivar)
    freq_count = Hash.new(0);
    self.chars.each{|c| freq_count[c] += 1}

    huffmanNodes = self.chars.uniq.map{|letter| HuffmanNode.new(letter,freq_count[letter]) }

    heap = Heap.new(huffmanNodes)

    until heap.size == 1
      smallest = heap.pop_min
      smallest.letters.each do |letter|
        @codes[letter] += "0"
      end

      second_smallest = heap.pop_min
      second_smallest.letters.each do |letter|
        @codes[letter] += "1"
      end

      combined = smallest.combine(second_smallest)
      heap.insert(combined)
    end

    self.gsub!(/./){|c| codes[c]}
  end

  def decode!
    inverted_code = codes.invert

    frag_idx = 0
    frag_length = 1
    results = []
    # should turn this back into the original message
    until frag_idx == self.length
      current_frag = self.slice(frag_idx, frag_length).reverse

      if inverted_code[current_frag]
        results << current_frag
        frag_idx += frag_length
        frag_length = 1
      else
        frag_length += 1
      end
    end

    # final = self.chars.zip(results).to_h
    # p results

    # self.gsub!(/./){ |c| final[c] }

    final = self.chars.zip(results.reverse).to_h
    p final
    self.gsub!(/./){|c| [c]}
  end

  def fixed_compression_factor
    # calculate the compression savings compared to fixed-length encoding
  end

  def ascii_compression_factor
    # calculate the compression savings compared to ASCII encoding
  end
end
