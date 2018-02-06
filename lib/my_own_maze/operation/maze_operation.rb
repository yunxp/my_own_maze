class MazeOperation < Operation
  ACTIONS = ['a', 'd', 'w', 's', 'h']

  def do(action)
    return unless ACTIONS.include?(action)
    send("do_#{action}")
  end

  def print_maze
    @style.print_maze(@maze)
    @style.print_player(@player)
  end

  # help
  def do_h
    points = @rule.calculate(@player.x, @player.y)
    print_maze
    @style.print_points(points, 'result')
  end
  
  # go left
  def do_a
    go(@player.x - 1, @player.y)
  end

  # go right
  def do_d
    go(@player.x + 1, @player.y)
  end

  # go up
  def do_w
    go(@player.x, @player.y - 1)
  end

  # go down
  def do_s
    go(@player.x, @player.y + 1)
  end

  private
  def go(x, y)
    return unless @rule.can_go?(x, y)
    @player.set_position(x, y)
    print_maze
  end
end
