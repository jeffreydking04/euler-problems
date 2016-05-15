require 'prime'

def prime_factorization(n)
  Prime.prime_division(n).flat_map { |factor, power| [factor] * power }
end

# the idea is to return an array that has every factor of the number
# prime factorizations of prime numbers are empty sets
# the gcds have already been summed(in the initial sum declaration)
def factor_array(arr, num)
  len = arr.length - 2

  for z in (0...len)
    for x in (0...arr.length)
      for y in (x+1...arr.length)
        product = arr[x] * arr[y] 
        arr.push(product) if ((product < num) and num % product == 0 and !arr.include?(product))
      end
    end
  end

  arr.sort!.uniq!
  arr
end



def sum_it(arr, count_array, total_array, number)
  sum = 0
  num = arr[-1]
  range = (number - (num ** 2)) / num
  full_cycles = range / num
  remainder = range % num

  if arr.length == 2
    sum += (((num - 1) * 2) + num * 2) * full_cycles + 2 * remainder
    return sum
  end

  count_array = arr.map do |x| num / x end
  
#  first = arr.length - 2
#  second = arr.length - 1
  (arr.length - 2).downto(0) do |x|
    (arr.length - 1).downto(x+1) do |y|
       if arr[y] % arr[x] == 0
          count_array[x] -= count_array[y]
       end 
    end
  end


  total_array = [count_array.length]
  for x in (0...count_array.length)
    total_array[x] = count_array[x] * arr[x]
  end
  sum += total_array.inject(0){|sum,x| sum + x } * 2 * full_cycles

  for x in (1..remainder)
    sum += (num).gcd(num + x) * 2
  end
  sum
end

def answer(number)
  limit = Math::sqrt(number).floor

  sum = number * 2 - 1

  (2..limit).each do |x| sum += x end 
  array = []
  fac_array = []
  array3 = []
  array4 = []
  for num in (2..limit)
    array = prime_factorization(num)

    array = [] if num.prime?

    if array != [] 
      fac_array = factor_array(array, num)
    else 
      fac_array = array
    end

    fac_array.push(num)
    fac_array.push(1)
    fac_array.sort!

    sum += sum_it(fac_array, array3, array4, number) 
    array3 = []
    array4 = []

    print num if num % 10000 == 0
    print " " if num % 10000 == 0
    puts Time.now if num % 10000 == 0
  end


 sum
end

 puts answer(ARGV[0].to_i)
