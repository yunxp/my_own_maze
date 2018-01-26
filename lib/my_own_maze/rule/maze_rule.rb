class MazeRule < Rule

  def success?(x, y)
    point = @board.find_point(x, y)
    point && point.is_type?('end_point')
  end

  # can go?
  def can_go?(x, y)
    point = @board.find_point(x, y)
    point && !point.is_type?('wall')
  end
end
