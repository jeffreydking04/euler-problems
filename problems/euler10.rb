require 'prime'
sum = 0
(1...2000000).each do |x|
  sum += x if Prime.prime?(x)
  puts x if x % 1000 == 0
end
puts sum