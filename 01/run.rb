input = File.read('input.txt').split("\n")
input = input.map{|i| i.to_i }

# Part 1
# puts input.reduce{|a,b| a+b}
#508

# Part 2
results = []
pos = 0

found = false
while !found do
	input.each do |i|
		pos = pos + i
		if results.include? pos
			puts pos
			found = true
			exit 0
		end
		results.push pos
	end
end