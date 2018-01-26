class Point
  attr_accessor :x, :y, :type
  
  def initialize(x, y, type)
    @x = x
    @y = y
    @type = type
  end

  def is_type?(type)
    @type == type
  end

  def set_position(x, y)
    @x, @y = x, y
  end
end
