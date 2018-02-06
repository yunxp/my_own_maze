class MazeRule < Rule

  def initialize(maze)
    @maze = maze
  end

  def success?(x, y)
    @maze.is_end?(x, y)
  end

  # can go?
  def can_go?(x, y)
    @maze.has_point?(x, y)
  end

  def calculate(x, y)
    MazeSolution.new(@maze).calculate(x, y)
  end
end
