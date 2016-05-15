require 'prime'

def prime_factorization(n)
  Prime.prime_division(n).flat_map { |factor, power| [factor] * power }
end

array = Array.new(2, 0)

(2..32000000).each do |x|
    if Prime.prime?(x)
       array[1] += 1
    else
       array[0] += 1
     end

#    array[prime_factorization(x).length] += 1
    puts x if x % 1000 == 0
  end

#array.each_with_index do |x, i|
#  puts "#{i}:   #{x}"
#end