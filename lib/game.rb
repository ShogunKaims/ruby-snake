require_relative 'snake'
require_relative 'food'
require_relative 'board'

class Game
  attr_reader :score

  def initialize(width, height)
    @board = Board.new(width, height)
    @snake = Snake.new(width / 2, height / 2)
    @food = Food.new(width, height)
    @food.respawn(@snake.body)
    @score = 0
    @over = false
  end

  def over?
    @over
  end

  def turn(direction)
    @snake.turn(direction)
  end

  def tick
    return if over?

    target = @board.wrap(@snake.next_head)

    if target == @food.position
      @snake.grow(target)
      @score += 1
      @food.respawn(@snake.body)
    else
      @snake.move(target)
    end

    @over = true if @snake.bites_itself?
  end

  def render(theme = Board::DEFAULT_THEME)
    @board.render(@snake, @food, theme)
  end
end
