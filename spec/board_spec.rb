require_relative '../lib/board'

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
end
