class Food
  attr_reader :position

  def initialize(width, height)
    @width = width
    @height = height
    @position = [3, 3]
  end

  def respawn(occupied)
    loop do
      candidate = [rand(@width), rand(@height)]
      unless occupied.include?(candidate)
        @position = candidate
        break
      end
    end
  end
end
