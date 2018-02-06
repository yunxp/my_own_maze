class Board
  attr_accessor :points, :width, :height

  def initialize(points, width, height)
    @points = points
    @width = width
    @height = height
  end

  def find_point(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end
end
