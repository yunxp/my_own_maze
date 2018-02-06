class Maze
  attr_accessor :width, :height, :points, :start_point, :end_point

  def initialize(width, height, points, start_point, end_point)
    @width = width
    @height = height
    @points = points
    @start_point = start_point
    @end_point = end_point
  end

  def find_point(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end

  def has_point?(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end

  def is_end?(x, y)
    @end_point.x == x && @end_point.y == y
  end
end
