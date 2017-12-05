class Turtle
  attr_accessor :direction, :pointer, :pointers

  def initialize
    self.pointers = [[0,0].inspect]
    self.direction = 0
    self.pointer=[0,0]
  end
  def turn(dir)
    if dir == 'R'
      self.direction += 1
    else
      self.direction -= 1
    end
    self.direction = direction%4
  end
  def move(distance)
    if self.direction == 0
      for n in 1..distance do
        self.pointer[1] += 1
        self.pointers << self.pointer.inspect
        break if self.hq
      end
    elsif self.direction == 2
      for n in 1..distance do
        self.pointer[1] -= 1
        self.pointers << self.pointer.inspect
        break if self.hq
      end
    elsif self.direction ==1
      for n in 1..distance do
        self.pointer[0] += 1
        self.pointers << self.pointer.inspect
        break if self.hq
      end
    else
      for n in  1..distance do
        self.pointer[0] -= 1
        self.pointers << self.pointer.inspect
        break if self.hq
      end
    end
  end
  def hq
    self.pointers.uniq.size != self.pointers.size
  end
end
map = Turtle.new
input = "L3, R2, L5, R1, L1, L2, L2, R1, R5, R1, L1, L2, R2, R4, L4, L3, L3, R5, L1, R3, L5, L2, R4, L5, R4, R2, L2, L1, R1, L3, L3, R2, R1, L4, L1, L1, R4, R5, R1, L2, L1, R188, R4, L3, R54, L4, R4, R74, R2, L4, R185, R1, R3, R5, L2, L3, R1, L1, L3, R3, R2, L3, L4, R1, L3, L5, L2, R2, L1, R2, R1, L4, R5, R4, L5, L5, L4, R5, R4, L5, L3, R4, R1, L5, L4, L3, R5, L5, L2, L4, R4, R4, R2, L1, L3, L2, R5, R4, L5, R1, R2, R5, L2, R4, R5, L2, L3, R3, L4, R3, L2, R1, R4, L5, R1, L5, L3, R4, L2, L2, L5, L5, R5, R2, L5, R1, L3, L2, L2, R3, L3, L4, R2, R3, L1, R2, L5, L3, R4, L4, R4, R3, L3, R1, L3, R5, L5, R1, R5, R3, L1"
instructions = input.split(/, /)
instructions.each do |instruction|
  map.turn(instruction.split(//)[0])
  map.move(instruction.split(//)[1..-1].join.to_i)
  break if map.hq
end

puts map.pointer.inspect
puts map.pointers.inspect
puts map.pointer[0].abs + map.pointer[1].abs
