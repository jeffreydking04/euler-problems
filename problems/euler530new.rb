# I believe that a solution can be arrived at by 
require 'prime'

def prime_factorization(n)
  Prime.prime_division(n).flat_map { |factor, power| [factor] * power }
end

NUMBER = 50
limit = Math::sqrt(NUMBER).floor
array = Array.new(limit){Array.new}

for number in (2..limit)
  array[number] = prime_factorization(number)
  array[number] = [] if number.prime?
  puts number if number % 100000 == 0
end

sum = NUMBER * 2 - 1
(2..limit).each do |x| sum += x end 



array.each_with_index do |value, index|
  next if (index == 0) || (index == 1)
  range = (NUMBER - index ** 2) / index
  full_cycles = range / index
  remainder = range % index
  decomp = value.length
  if decomp == 0
    sum += ((index - 1) * 2) * full_cycles + index * full_cycles * 2 + 2 * remainder 
  end
end

puts sum
