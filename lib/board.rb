class Board
  def initialize(width, height)
    @width = width
    @height = height
  end

  def inside?(cell)
    x, y = cell
    x.between?(0, @width - 1) && y.between?(0, @height - 1)
  end

  def render(snake, food)
  grid = Array.new(@height) { Array.new(@width, '.') }

  snake.body.each do |x, y|
    grid[y][x] = 'O'
  end

  head_x, head_y = snake.head
  grid[head_y][head_x] = '@'

  food_x, food_y = food.position
  grid[food_y][food_x] = '*'

  grid.map { |row| row.join(' ') }.join("\n")
  end
end
