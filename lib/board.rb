class Board
  def initialize(width, height)
    @width = width
    @height = height
  end

  def inside?(cell)
    x, y = cell
    x.between?(0, @width - 1) && y.between?(0, @height - 1)
  end
end
