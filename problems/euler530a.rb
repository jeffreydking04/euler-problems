
def p530(num)

  # 1 * every number in the range has a gcd of 1, except for 1 * 1,
  # these factorizations exist in pairs, so there are 2 * num - 1
  # factorizations in the range involving 1
  sum = 2 * num - 1    # 19

  current = 2
  limit = num / current  # 5

  while current <= limit   # true, true
    range = (num - current ** 2)  # 6, 1
    array = Array.new(current)  #array size: 2, 3
    sum += current     # 21, 32    
    array_sum = 0

    array.each_with_index do |value, index|
      array[index] = current.gcd(current + index) * 2 # [4,2], [6,2,2]
      array_sum += array[index] # 6, 10
    end


    full_circuit = range / (current ** 2) # 1, 0
    sum += (full_circuit * array_sum) # 27, 32

  
    remainder = (range / current) % current  # 1, 

    for i in (1..remainder) do
      sum += array[i] # 29,
    end



    current += 1 # 3
    limit = num / current # 3
    print Time.now if current % 10000 == 0
    print " " if current % 10000 == 0
    print current if current % 10000 == 0
    puts "" if current % 10000 == 0
  end

 sum

end



puts p530(100000000)