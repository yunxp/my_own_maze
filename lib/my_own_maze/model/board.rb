class Board
  attr_accessor :width, :height, :points

  def initialize(width, height, points)
    @width = width
    @height = height
    @points = points
  end

  def find_point(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end
end
