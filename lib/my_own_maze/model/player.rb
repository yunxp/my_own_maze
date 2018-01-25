class Player
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def set_position(x, y)
    @x, @y = x, y
  end
end
