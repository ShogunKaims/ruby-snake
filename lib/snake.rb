class Snake
  attr_reader :body

  
  def initialize(x, y)
    @body = [[x, y], [x - 1, y], [x - 2, y]]
    @direction = [1, 0]
  end

  def head
    @body.first
  end

  def next_head
    [head[0] + @direction[0], head[1] + @direction[1]]
  end

  def move
    @body.unshift(next_head)
    @body.pop
  end

  def turn(new_direction)
    opposite = [-@direction[0], -@direction[1]]
    @direction = new_direction unless new_direction == opposite
  end

  def grow
    @body.unshift(next_head)
  end

  def length
    @body.size
  end
end
