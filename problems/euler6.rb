def sum_of_squares(number)
    sum = 0
   (1..number).each do |x|
      sum += x ** 2
    end 
    sum
end

def square_of_sum(number)
   (number * (number + 1) / 2) ** 2
end

x = 100
puts square_of_sum(x) - sum_of_squares(x)