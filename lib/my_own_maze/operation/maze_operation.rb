class MazeOperation < Operation
  ACTIONS = ['a', 'd', 'w', 's']

  def do(action)
    return unless ACTIONS.include?(action)
    send("do_#{action}")
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
  end
end
