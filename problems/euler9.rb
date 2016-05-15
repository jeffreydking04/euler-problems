a = 0
b = 0
(1..332).each do |x|
  (((1000 - x) / 2).floor).downto(a) do |y|
    break if ((x ** 2) + (y ** 2)) < (1000 - x - y) ** 2
    if ((x ** 2) + (y ** 2)) == (1000 - x - y) ** 2
      a = x
      b = y
    end
  end
end

puts "a = #{a}"
puts "b = #{b}"
puts "c = #{1000 - b - a}"