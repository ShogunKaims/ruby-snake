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

  describe '#wrap' do
    it 'leaves a cell inside the board unchanged' do
      expect(board.wrap([3, 3])).to eq([3, 3])
    end

    it 'comes back on the left after leaving on the right' do
      expect(board.wrap([10, 5])).to eq([0, 5])
    end

    it 'comes back on the right after leaving on the left' do
      expect(board.wrap([-1, 5])).to eq([9, 5])
    end

    it 'comes back at the bottom after leaving at the top' do
      expect(board.wrap([5, -1])).to eq([5, 9])
    end

    it 'comes back at the top after leaving at the bottom' do
      expect(board.wrap([5, 10])).to eq([5, 0])
    end
  end

  describe '#render with a custom theme' do
    it 'uses the symbols of the theme' do
      theme = { empty: '-', body: 'o', head: 'H', food: 'F', separator: '' }
      expected = [
        '-----',
        'ooH--',
        '-----',
        '---F-',
        '-----'
      ].join("\n")

      expect(Board.new(5, 5).render(Snake.new(2, 1), Food.new(5, 5), theme)).to eq(expected)
    end
  end
end
