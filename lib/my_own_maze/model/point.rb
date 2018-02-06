class Point
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def set_position(x, y)
    @x, @y = x, y
  end
end
