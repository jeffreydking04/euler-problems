def answer(number)

  square_root = Math::sqrt(number).floor

  sum = 2 * number - 1

  (2..square_root).each do |x| sum += x end   
  puts Time.now
  (2..square_root).each do |x|
    puts "#{x}: #{Time.now}" if x % 10000 == 0
    (1..x).each do |y|
      break if x * (x + y) > number
      gcd = x.gcd(x + y)
      sum += gcd * 2
      range = number - (x * (x + y))
      iterations = range / (x ** 2)
      sum += 2 * gcd * iterations
    end
  end


  sum

end

puts answer(10)