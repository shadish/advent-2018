require 'date'

def parse(line)
	d = line.scan(/\d+/).map{|d| d.to_i}
	c = line.split(']')[1].strip!
	{
		:date => DateTime.new(d[0],d[1],d[2],d[3],d[4]),
		:cmd => c.scan(/\d+/)[0] || c
	}
end

input = File.read('input.txt').split("\n")
	.map{|line| parse(line)}
	.sort{|a,b| a[:date] <=> b[:date]}

guards = input.map{|d| d[:cmd].to_i }.reject{|d| d == 0}.uniq
	.inject({}) {|k,v| k[v] = Array.new(60,0); k }


current_guard = input[0][:cmd].to_i

input.each_with_index do |v,i|
	if(input[i][:cmd] == 'falls asleep')
		(v[:date].minute..input[i+1][:date].minute-1).each do |m|
			guards[current_guard][m] += 1
		end
	elsif(input[i][:cmd].to_i > 0)
		current_guard = input[i][:cmd].to_i
	end
end

results = guards.map{ |k,v|
	max = v.max
	sum = v.reduce{|a,b| a+b}
	{:id => k, :sum => sum, :minute => v.find_index(max)}
}.sort {|a,b| a[:sum] <=> b[:sum] }.reverse

puts results.first[:id] * results.first[:minute]