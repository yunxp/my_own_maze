class MazeRule < Rule
  def initialize(board, player, end_point)
    @end_point = end_point
    super(board, player)
  end

  def success?
    @player.x == @end_point.x && @player.y == @end_point.y
  end

  # can go left?
  def can_do_a?
    can_go?(@player.x - 1, @player.y)
  end

  # can go right?
  def can_do_d?
    can_go?(@player.x + 1, @player.y)
  end

  # can go up?
  def can_do_w?
    can_go?(@player.x, @player.y - 1)
  end

  # can go down?
  def can_do_s?
    can_go?(@player.x, @player.y + 1)
  end

  private
  def can_go?(x, y)
    point = @board.find_point(x, y)
    point && !point.is_type?('wall')
  end
end
