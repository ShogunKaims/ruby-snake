require_relative '../lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'defaults to the classic mode' do
      expect(Game.new(10, 10).mode).to eq(:classic)
    end

    it 'rejects an unknown mode' do
      expect { Game.new(10, 10, mode: :nope) }.to raise_error(ArgumentError)
    end
  end

  describe '#tick' do
    it 'keeps the game going while the snake moves' do
      game = Game.new(10, 10)
      4.times { game.tick }
      expect(game.over?).to eq(false)
    end

    it 'ends the game when the snake leaves the board in classic mode' do
      game = Game.new(10, 10, mode: :classic)
      5.times { game.tick }
      expect(game.over?).to eq(true)
    end

    it 'wraps around the board instead of ending the game in chill mode' do
      game = Game.new(10, 10, mode: :chill)
      12.times { game.tick }
      expect(game.over?).to eq(false)
    end

    it 'scores a point when the snake eats the food' do
      allow_any_instance_of(Food).to receive(:respawn)
      game = Game.new(5, 6)
      game.tick
      expect(game.score).to eq(1)
    end
  end
end
