class MazeOperation < Operation
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
    @board.find_point(@player.x, @player.y).type = 'road'
    @player.set_position(x, y)
    @board.find_point(x, y).type = 'player'
  end
end
