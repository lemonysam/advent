class Pointer
  attr_accessor :loc, :edge
  loc=[]
  edge = 1
  def initialize
    self.loc = [1,0]
    self.edge = 1
  end
  def top?
    self.loc[1] == edge
  end
  def bottom?
    self.loc[1] == 0-edge
  end
  def left?
    self.loc[0] == 0 - edge
  end
  def right?
    self.loc[0] == edge
  end

  def move_up
    self.loc[1] +=1
  end
  def move_down
    self.loc[1] -=1
  end
  def move_left
    self.loc[0] -=1
  end
  def move_right
    self.loc[0] +=1
  end
  def new_ring
    @edge += 1
  end

  def result
    puts self.loc[0].abs + self.loc[1].abs
  end
end

class Grid
  attr_accessor :grid
  def initialize
    @grid = {}
    @grid[[0,0].inspect] = 1
  end
  def extend(loc)
    surrounds = self.surrounds(loc)
    sum = 0
    surrounds.each do |surr|
      if self.grid[surr.inspect]
        sum += self.grid[surr.inspect]
      end
    end

    self.grid[loc.inspect] = sum
    return sum
  end

  def surrounds(loc)
    xrange = (loc[0]-1)..(loc[0]+1)
    yrange = (loc[1]-1)..(loc[1]+1)

    surrounds = []
    for x in xrange
      for y in yrange
        surr = [x,y]
        surrounds << surr unless surr == loc
      end
    end
    return surrounds
  end
end
pointer = Pointer.new
grid = Grid.new
grid.extend(pointer.loc)
i = 0
value = 0
while value < 347991
  i +=1
  if pointer.right?
    #puts "right"
    if pointer.top?
      #puts "top"
      pointer.move_left
    elsif pointer.bottom?
      #puts "bottom"
      pointer.new_ring
      pointer.move_right
    else
      pointer.move_up
    end
  elsif pointer.left?
    #puts "left"
    if !pointer.bottom?
      #puts "not bottom"
      pointer.move_down
    elsif pointer.bottom?
      #puts "bottom"
      pointer.move_right
    end
  else
    if pointer.top?
      pointer.move_left
    elsif pointer.bottom?
      pointer.move_right
    end
  end
  value = grid.extend(pointer.loc)

  #puts "#{pointer.loc.inspect} #{pointer.top?} #{pointer.bottom?} #{pointer.left?} #{pointer.right?}"
end

puts "#{value} - #{i}"
#puts pointer.loc.inspect
#pointer.result
