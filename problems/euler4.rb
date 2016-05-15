a = []
for x in (100...1000)
  for y in (100...1000)
    a.push(x * y) if (x * y).to_s == (x * y).to_s.reverse
  end
end
puts a.sort[-1]
