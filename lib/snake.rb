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

  def move(cell = next_head)
    @body.unshift(cell)
    @body.pop
  end

  def turn(new_direction)
    opposite = [-@direction[0], -@direction[1]]
    @direction = new_direction unless new_direction == opposite
  end

  def grow(cell = next_head)
    @body.unshift(cell)
  end

  def length
    @body.size
  end

  def bites_itself?
    @body.drop(1).include?(head)
  end
end
