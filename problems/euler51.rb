require 'prime'

def step_to
  (56003..999999).step(2).each do |x|
    p x
  str = x.to_s
    len = str.length - 2

    (2..len).each do |a|
      (1...a).each do |b|
        count = 0
        (0..9).each do |y|
          str[a] = y.to_s
          str[b] = y.to_s
          num = str.to_i
          count += 1 if Prime.prime?(num)
        end
        puts a if count  >= 8
        puts b if count >= 8
        return x if count >= 8
        str = x.to_s
      end
    end
  end 
end

puts step_to

