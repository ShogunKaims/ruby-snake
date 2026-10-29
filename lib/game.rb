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

    if @snake.next_head == @food.position
      @snake.grow
      @score += 1
      @food.respawn(@snake.body)
    else
      @snake.move
    end

    @over = true if !@board.inside?(@snake.head) || @snake.bites_itself?
  end

  def render
    @board.render(@snake, @food)
  end
end
