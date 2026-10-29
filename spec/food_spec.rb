require_relative '../lib/snake'
require_relative '../lib/food'

RSpec.describe Food do
  let(:snake) { Snake.new(5, 5) }
  let(:food) { Food.new(10, 10) }

  describe '#respawn' do
    it 'never lands on the snake' do
      50.times do
        food.respawn(snake.body)
        expect(snake.body).not_to include(food.position)
      end
    end
  end
end
