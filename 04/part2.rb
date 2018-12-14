#Part 1
def parse_claim(line)
	coords = line.split('@ ')[1].split(': ')
	{
		:claim => line.split(' @')[0].gsub(/#/,'').to_i,
		:x => coords[0].split(",").map{|i| i.to_i}[0],
		:y => coords[0].split(",").map{|i| i.to_i}[1],
		:width  => coords[1].split("x").map{|i| i.to_i}[0],
		:height  => coords[1].split("x").map{|i| i.to_i}[1]
	}
end

input = File.read('input.txt').split("\n").map{|line| parse_claim(line)}


grid = []
@GRID_SIZE = 999

(0..@GRID_SIZE).each do |i|
		grid[i] = Array.new(@GRID_SIZE)
	(0..@GRID_SIZE).each do |j|
		grid[i][j] = 0
	end
end

input.each do |i|
	(i[:x]..i[:x]+i[:width]-1).each do |xx|
		(i[:y]..i[:y]+i[:height]-1).each do |yy|
			grid[xx][yy] += 1
		end
	end
end

input.each do |i|
	overlaps = 0
	(i[:x]..i[:x]+i[:width]-1).each do |xx|
		(i[:y]..i[:y]+i[:height]-1).each do |yy|
			if(grid[xx][yy] > 1)
				overlaps += 1
			end
		end
	end
	if overlaps == 0
		p i[:claim]
		exit 0
	end
end
