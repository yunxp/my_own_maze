class MazeSolution
  DIRS = {
    'l' => [-1, 0],
    'r' => [1, 0],
    'u' => [0, -1],
    'd' => [0, 1]
  }

  def initialize(maze)
    @maze = maze
    @points = []
    init_dirs
  end

  def calculate(x, y)
    @points = [@maze.find_point(x, y)]
    while !@maze.is_end?(@points.last.x, @points.last.y)
      start_point = @points.last
      result = false
      while !result && @dirs[start_point].size > 0
        next_step = @dirs[start_point].last
        @dirs[start_point].pop
        x, y = start_point.x + DIRS[next_step][0], start_point.y + DIRS[next_step][1]
        next_point = @maze.find_point(x, y)
        if next_point && !has_point?(x, y)
          @points << next_point
          result = true
        end
      end
      @points.pop unless result
    end
    @points[1...@points.size]
  end

  private
  def has_point?(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end

  def init_dirs
    @dirs = @maze.points.map {|point| {point => DIRS.keys.sample(4)} }.inject(:merge)
  end
end