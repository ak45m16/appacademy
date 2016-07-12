class RPNCalculator
  # TODO: your code goes here!
  def initialize
  	@calculator = []
  end

  def push(num)
  	@calculator.push(num)
  end

  def plus
  	if @calculator.length > 1 
  		@calculator.push(@calculator.pop(2).inject(:+)) 
  	else
  		fail
  	end
  end

  def value
  	return @calculator[@calculator.length-1]
  end

  def minus 
  	if @calculator.length > 1 
  		@calculator.push(@calculator.pop(2).inject(:-)) 
  	else
  		fail
  	end
  end

  def times
  	if @calculator.length > 1 
  		@calculator.push(@calculator.pop(2).inject(:*)) 
  	else
  		fail
  	end
  end

  def divide 
  	if @calculator.length > 1 
  		@calculator.push(@calculator.pop(2).inject{|x,y| x.to_f / y})
  	else
  		fail
  	end
  end

  def fail
    begin
      raise Exception.new("calculator is empty")
    end
  end


end
