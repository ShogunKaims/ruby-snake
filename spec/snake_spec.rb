require_relative '../lib/snake'

RSpec.describe Snake do
  let(:snake) { Snake.new(5, 5) }

  describe '#head' do
    it 'returns the first cell of the body' do
      expect(snake.head).to eq([5, 5])
    end
  end

  describe '#move' do
    it 'moves the head one cell to the right' do
      snake.move
      expect(snake.head).to eq([6, 5])
    end
    
    it 'moves the head to a given cell' do
      snake.move([9, 9])
      expect(snake.head).to eq([9, 9])
    end
  end

  describe '#turn' do
    it 'goes up after turning up' do
      snake.turn([0, -1])
      snake.move
      expect(snake.head).to eq([5, 4])
    end

    it 'ignores a 180-degree turn' do
      snake.turn([-1, 0])
      snake.move
      expect(snake.head).to eq([6, 5])
    end
  end

  describe '#length' do
    it 'starts with 3 cells' do
      expect(snake.length).to eq(3)
    end
  end

  describe '#grow' do
    it 'adds one cell and moves the head forward' do
      snake.grow
      expect(snake.length).to eq(4)
      expect(snake.head).to eq([6, 5])
    end
  end

  describe '#bites_itself?' do
    it 'is false for a new snake' do
      expect(snake.bites_itself?).to eq(false)
    end

    it 'is true when the head hits the body' do
      2.times { snake.grow }
      snake.turn([0, 1])
      snake.move
      snake.turn([-1, 0])
      snake.move
      snake.turn([0, -1])
      snake.move
      expect(snake.bites_itself?).to eq(true)
    end
  end
end
