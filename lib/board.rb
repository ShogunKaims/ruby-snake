class Board
  DEFAULT_THEME = { empty: '.', body: 'O', head: '@', food: '*', separator: ' ' }.freeze
  EMOJI_THEME   = { empty: '⬛', body: '🟩', head: '🟢', food: '🍎', separator: '' }.freeze

  def initialize(width, height)
    @width = width
    @height = height
  end

  def inside?(cell)
    x, y = cell
    x.between?(0, @width - 1) && y.between?(0, @height - 1)
  end

  def wrap(cell)
    x, y = cell
    [x % @width, y % @height]
  end

  def render(snake, food, theme = DEFAULT_THEME)
    grid = Array.new(@height) { Array.new(@width, theme[:empty]) }

    snake.body.each do |x, y|
      grid[y][x] = theme[:body] if inside?([x, y])
    end

    head_x, head_y = snake.head
    grid[head_y][head_x] = theme[:head] if inside?(snake.head)

    food_x, food_y = food.position
    grid[food_y][food_x] = theme[:food]

    grid.map { |row| row.join(theme[:separator]) }.join("\n")
  end
end
