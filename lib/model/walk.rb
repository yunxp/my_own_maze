class Walk
  attr_accessor :board

  def initialize(board)
    @board = board
    @player = board.player
  end

  def success?
    @player.x == @board.end_point.x && @player.y == @board.end_point.y
  end

  def go_left
    point = @board.find_point(@player.x - 1, @player.y)
    @player.x = @player.x - 1 if point && !point.is_wall?
  end

  def go_right
    point = @board.find_point(@player.x + 1, @player.y)
    @player.x = @player.x + 1 if point && !point.is_wall?
  end

  def go_up
    point = @board.find_point(@player.x, @player.y - 1)
    @player.y = @player.y - 1 if point && !point.is_wall?
  end

  def go_down
    point = @board.find_point(@player.x, @player.y + 1)
    @player.y = @player.y + 1 if point && !point.is_wall?
  end
end
