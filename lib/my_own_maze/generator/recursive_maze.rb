class RecursiveMaze

  DIRS = {
    'l' => [-1, 0],
    'r' => [1, 0],
    'u' => [0, -1],
    'd' => [0, 1]
  }

  def initialize(width, height)
    @width = width
    @height = height
    @start_point = Point.new(0, 1)
    @end_point = nil
    @history = [Point.new(1, 1)]
    @points = [@start_point, @history[0]]
  end

  def generate
    while @history.size > 0
      point = @history.last
      result = false
      dirs = []
      while(!result && dirs.size != DIRS.keys.size)
        next_step = DIRS.keys.sample
        while dirs.include?(next_step)
          next_step = DIRS.keys.sample
        end
        dirs << next_step
        result = go(next_step, point)
      end
      unless result
        @history.pop
      end
    end
    @points << @end_point if @end_point
    Maze.new(@width, @height, @points, @start_point, @end_point)
  end

  private
  def has_point?(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end

  def can_next?(x, y)
    x > 0 && x < @width && y > 0 && y < @height && !has_point?(x, y)
  end

  def go(next_step, point)
    set_end_point(point) if next_step == 'r' && @end_point.nil?
    x, y = point.x + DIRS[next_step][0] * 2, point.y + DIRS[next_step][1] * 2
    return false unless can_next?(x, y)
    next_point = Point.new(x, y)
    @points << Point.new(point.x + DIRS[next_step][0], point.y + DIRS[next_step][1])
    @points << next_point
    @history << next_point
    return true
  end

  def set_end_point(point)
    @end_point = Point.new(point.x + 1, point.y) if point.x + 1 == @width - 1
  end
end
