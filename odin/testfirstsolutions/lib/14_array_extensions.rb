class Array 
 	def sum
 		sum = 0
 		self.each do |i|
 			sum += i
 		end
 		sum
 	end

 	def square
 		self.map {|i| i*i}
 	end

 	def square!
 		self.map! {|i| i*i}
 	end

end

	
