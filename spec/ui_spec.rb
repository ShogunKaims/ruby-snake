require_relative '../lib/ui'

RSpec.describe UI do
  describe '.visible_width' do
    it 'ignores color codes' do
      expect(UI.visible_width(UI.paint('abc', UI::GREEN))).to eq(3)
    end

    it 'counts an emoji as two columns' do
      expect(UI.visible_width('🍎')).to eq(2)
    end
  end

  describe '.center' do
    it 'pads the text to the requested width' do
      expect(UI.center('ab', 10)).to eq('    ab    ')
    end
  end

  describe '.frame' do
    it 'draws a border around a grid of emojis' do
      lines = UI.frame("🟩🟩\n⬛⬛")
      expect(lines.map { |line| UI.visible_width(line) }.uniq).to eq([6])
    end
  end

  describe '.title_screen' do
    it 'has every line as wide as the box' do
      expect(UI.title_screen.map { |line| UI.visible_width(line) }.uniq).to eq([UI::WIDTH])
    end
  end

  describe '.game_over_screen' do
    it 'has every line as wide as the box' do
      lines = UI.game_over_screen(12, 'Chill')
      expect(lines.map { |line| UI.visible_width(line) }.uniq).to eq([UI::WIDTH])
    end
  end
end
