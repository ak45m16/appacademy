class Dictionary
  # TODO: your code goes here!
  def initialize(opts={})
  	@opts = opts
  end

  def entries
  	@opts
  end

  def add(opts)
  	opts.is_a?(String) ? @opts.merge!(opts => nil) : @opts.merge!(opts)
  end

  def keywords
  	@opts.keys.sort
  end

  def include?(key)
  	@opts.has_key?(key)
  end

  def find(key)
  	@opts.select { |word,defin| word.scan(key).join == key }
  end

  def printable
	jelly = ""
	opts_sorted = @opts.sort_by { |word, defin| word}
	opts_sorted.each do |word, defin|
		jelly << "[#{word}] \"#{defin}\"\n"
	end
	return jelly.chomp
  end
end
