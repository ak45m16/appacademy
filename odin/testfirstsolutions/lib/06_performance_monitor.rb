
def measure(n=1)
	start = Time.now
	n.times do
		yield
	end
	final = Time.now
	return ((final - start)/n)
end
