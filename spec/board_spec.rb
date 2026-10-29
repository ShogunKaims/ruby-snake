require_relative '../lib/board'
require_relative '../lib/snake'
require_relative '../lib/food'

RSpec.describe Board do
  let(:board) { Board.new(10, 10) }

  describe '#inside?' do
    it 'accepts the top-left corner' do
      expect(board.inside?([0, 0])).to eq(true)
    end

    it 'accepts the last coin' do
      expect(board.inside?([9, 9])).to eq(true)
    end

    it 'nope x is to big' do
      expect(board.inside?([10, 5])).to eq(false)
    end

    it 'nope x is negatif' do
      expect(board.inside?([-1, 5])).to eq(false)
    end

    it 'nope y is to big' do
      expect(board.inside?([5, 10])).to eq(false)
    end
  end

  describe '#render' do
    it 'draws the snake and the food' do
      small_board = Board.new(5, 5)
      snake = Snake.new(2, 1)
      food = Food.new(5, 5)

      expected = [
        '. . . . .',
        'O O @ . .',
        '. . . . .',
        '. . . * .',
        '. . . . .'
      ].join("\n")

      expect(small_board.render(snake, food)).to eq(expected)
    end

    it 'does not crash when the snake is outside the board' do
      small_board = Board.new(5, 5)
      snake = Snake.new(2, 5)
      food = Food.new(5, 5)

      expected = [
        '. . . . .',
        '. . . . .',
        '. . . . .',
        '. . . * .',
        '. . . . .'
      ].join("\n")

      expect(small_board.render(snake, food)).to eq(expected)
    end
  end
end
