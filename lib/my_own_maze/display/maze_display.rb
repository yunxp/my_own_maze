class MazeDisplay
  def initialize(style)
    @style = style
  end

  def print_maze(maze)
    (0...maze.height).each do |y|
      (0...maze.width).each do |x|
        type = maze.has_point?(x, y) ? 'road' : 'wall'
        print_point(x, y, type)
     end
    end
  end

  def print_points(points, type)
    points.each {|point| print_point(point.x, point.y, type) }
  end

  def print_player(point)
    print_point(point.x, point.y, 'player')
  end

  def print_success(line, col)
    print "\e[#{line};#{col}H#{'success!!!'.bg_magenta}"
  end

  private
  def print_point(x, y, type)
    value = @style.send("#{type}_style")
    value.each_with_index do |v, idx|
      line = y * @style.height + idx + 1
      column = x * @style.width + 1
      print "\e[#{line};#{column}H#{v}"
    end
  end
end