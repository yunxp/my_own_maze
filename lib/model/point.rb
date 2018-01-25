class Point
  attr_accessor :x, :y, :value
  def initialize(x, y, value)
    @x = x
    @y = y
    @value = value
  end

  def is_wall?
    @value == 1
  end
end
