puts "Grid length: "
len = Integer(gets)
puts "Grid width: "
wid = Integer(gets)
puts "\n"
array = Array.new(len) {Array.new(wid,1)}
for y in (1...wid) do
  for x in (1...len) do
    array [y][x] = array[y-1][x] + array[y][x-1]
  end
end
puts array[-1][-1]