input ="10	3	15	10	5	15	5	15	9	2	5	8	5	2	3	6"
@states = []

arr = input.split(/[ \t]/).map{|el| el.to_i}
puts arr.inspect

def repeated?
  @states.uniq.length != @states.length
end
count = 0
while !repeated?
  count += 1
  register = arr.max
  start_index = arr.index(arr.max)
  arr[start_index] = 0
  for i in 1..register
    arr[(start_index + i)%arr.size] +=1
  end
  @states << arr.join(' ')
end
loop_length = count - (@states.index(@states[-1])+1)

puts arr.inspect


puts count

puts loop_length
