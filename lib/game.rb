require_relative 'snake'
require_relative 'food'
require_relative 'board'

class Game
  MODES = %i[classic chill].freeze

  attr_reader :score, :mode

  def initialize(width, height, mode: :classic)
    raise ArgumentError, "unknown mode: #{mode}" unless MODES.include?(mode)

    @mode = mode
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

    target = @snake.next_head
    target = @board.wrap(target) if @mode == :chill

    if target == @food.position
      @snake.grow(target)
      @score += 1
      @food.respawn(@snake.body)
    else
      @snake.move(target)
    end

    @over = true if @snake.bites_itself? || !@board.inside?(@snake.head)
  end

  def render(theme = Board::DEFAULT_THEME)
    @board.render(@snake, @food, theme)
  end
end
