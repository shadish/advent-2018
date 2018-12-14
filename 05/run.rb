
input = File.read('input.txt')

polys = input.chars.map{|c| c.downcase}.sort.uniq

complete = false
until complete do
	previous_length = input.length
	polys.each do |c|
		input = input.gsub(/#{c}#{c.upcase}/,'')
		input = input.gsub(/#{c.upcase}#{c}/,'')
	end
	complete = input.length == previous_length
end

puts input.length