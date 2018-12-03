#Part 1
input = File.read('input.txt')
	.split("\n")
	.map{|i| i.split('')}
	.map{|i| i.group_by{|k,v| k}.map{|k,v| [k, v.size]}}

twos = input.select {|i| i.select{|k,v| v == 2}.length > 0 }
threes = input.select {|i| i.select{|k,v| v == 3}.length > 0}

puts twos.length * threes.length
#8610

#Part 2
def find_matches(input)
	code_length = input[0].length
	input.each_with_index do |wordA, i|
		input.each_with_index do |wordB, j|
			if(i != j)
				matches = 0
				b = wordB.split('')

				wordA.split('').each_with_index do |a,idx|
					if(a == b[idx])
						matches += 1
					end
				end

				if(matches == code_length - 1)
					return [wordA,wordB]
				end
			end
		end
	end
end

input = File.read('input.txt').split("\n")

puts find_matches(input)
# iosnxmfkpabcjpdywvrtaqhluy
# iosnxmfkpabcjpdywvrtawhluy

