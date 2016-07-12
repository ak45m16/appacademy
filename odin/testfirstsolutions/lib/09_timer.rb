class Timer
	def seconds(seconds=0)
		@seconds = seconds
	end

	def seconds=(new_seconds)
		@seconds = new_seconds
	end

	def time_string(time_string="00:00:00")
		hh = @seconds/3600
		mm = @seconds%3600/60
		ss = @seconds%60
		time_string = "#{padded(hh)}:#{padded(mm)}:#{padded(ss)}"
		return time_string
	end

	def padded(num)
		if num < 10
			num = "0"+num.to_s
			return num
		else
			return "#{num}"
		end
	end

end
