x = 1
y = 1
sum = 0
dummy = x + y

while dummy < 4000001
  sum += dummy if dummy % 2 == 0
  x = y
  y = dummy
  dummy = x + y
end

puts sum
