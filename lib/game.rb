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

  def tick
    @snake.move
  end

  def render
    @board.render(@snake, @food)
  end
end
