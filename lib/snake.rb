class Snake

  def initialize(x, y)
    @body = [[x, y], [x - 1, y], [x - 2, y]]
    @direction = [1, 0]
  end

  def head
    @body.first
  end

  def move
    x = head[0] + @direction[0]
    y = head[1] + @direction[1]
    @body.unshift([x, y])
    @body.pop
  end

  def turn(new_direction)
    opposite = [-@direction[0], -@direction[1]]
    @direction = new_direction unless new_direction == opposite
  end

  def grow
    x = head[0] + @direction[0]
    y = head[1] + @direction[1]
    @body.unshift([x, y])
  end

  def length
    @body.size
  end
end
