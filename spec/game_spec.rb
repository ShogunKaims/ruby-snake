require_relative '../lib/game'

RSpec.describe Game do
  describe '#tick' do
    it 'keeps the game going while the snake is inside the board' do
      game = Game.new(10, 10)
      4.times { game.tick }
      expect(game.over?).to eq(false)
    end

    it 'ends the game when the snake leaves the board' do
      game = Game.new(10, 10)
      5.times { game.tick }
      expect(game.over?).to eq(true)
    end

    it 'scores a point when the snake eats the food' do
      allow_any_instance_of(Food).to receive(:respawn)
      game = Game.new(5, 6)
      game.tick
      expect(game.score).to eq(1)
    end
  end
end
