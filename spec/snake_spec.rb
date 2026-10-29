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
      snake.move                       # agir
      expect(snake.head).to eq([6, 5]) # vérifier
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
end


end
