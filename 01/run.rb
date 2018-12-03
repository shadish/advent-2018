input = File.read('input.txt').split("\n")
input = input.map{|i| i.to_i }

# Part 1
# puts input.reduce{|a,b| a+b}
#508

# Part 2
results = []
pos = 0
input.each do |i|
	pos = pos + i
	if results.include? pos
		puts pos
		# exit 0
	end
	results.push pos
end

# res = Hash::new
# results.each do |k|
# 	if !res.key?(k)
# 		res[k] = 0
# 	end
# 	res[k] += 1
# end

# puts res.select{|k,v| v > 1}
