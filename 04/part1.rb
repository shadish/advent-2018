require 'date'

def parse(line)
	d = line.scan(/\d+/).map{|d| d.to_i}
	c = line.split(']')[1].strip!

	{
		:date => DateTime.new(d[0],d[1],d[2],d[3],d[4]),
		:cmd => c.scan(/\d+/)[0] || c
	}
end

# input = File.read('input.txt').split("\n")
input = File.read('sample.txt').split("\n")
	.map{|line| parse(line)}
	.sort{|a,b| a[:date] <=> b[:date]}

days = input
	.map{|d| d[:date].strftime '%y-%m-%d' }
	.uniq
	.inject({}) {|k,v| k[v] = Array.new(60,0); k }

puts days