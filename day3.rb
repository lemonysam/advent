edge = 1
pointer = [1,0]
puts pointer.inspect

for i in 2..347990
  if pointer[0] == edge
    if pointer[1] == edge
      pointer[0] -= 1
    elsif pointer[1] == 0-edge
      edge+=1
      pointer[0] += 1
    else
      pointer[1] += 1
    end
  elsif pointer[0] == 0 - edge
    if pointer[1] > 0 - edge
      pointer[1] -= 1
    elsif pointer[1] == 0-edge
      pointer[0] += 1
    end
  else
    if pointer[1] == edge
      pointer[0] -= 1
    elsif pointer[1] == 0-edge
      pointer[0] += 1
    end
  end

end
puts pointer.inspect
puts pointer[0].abs + pointer[1].abs
