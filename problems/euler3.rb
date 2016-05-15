def prime_array
  num = 775147
  array = [2]
  count = 2
  index = 0
  check = [2]

  while count < num
    flag = true

    check.each {|prime|
      (flag = false) if (count % prime) == 0
        break if flag == false
    }

    array.push(count) if flag == true
    count += 1

    if count == array[index]**2
      index += 1
      check.push(array[index])
    end

  end
  array
end

array = prime_array
puts array.length

new_array = []

array.each do |x|
 new_array.push(x) if 600851475143 % x == 0
end

puts new_array.length
a = []
new_array.each do |x|
  a << 600851475143 / x
end
puts new_array
puts a



