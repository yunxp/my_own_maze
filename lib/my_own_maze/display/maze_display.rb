class MazeDisplay < Display
  def print_p
    print "\e[H"
    print_board
  end

  private
  def print_board
    (0...@board.height).each do |col|
      print_row(col)
    end
  end

  def print_row(col)
    cells = []
    (0...@board.width).each do |row|
      cells << send("#{@board.find_point(row, col).type}_style")
    end
    print_row_cells(cells)
  end

  def print_row_cells(cells)
    return if cells.nil? || cells[0].nil?
    str = ''
    (0...cells[0].size).each do |idx|
      cells.each do |cell|
        str += cell[idx]
      end
      str += "\n"
    end
    print str
  end

  def player_style
    [
      ' O ',
      '/> '
    ]
  end

  def wall_style
    [
      '   '.bg_brown,
      '   '.bg_brown
    ]
  end

  def road_style
    [
      ' - ',
      ' - '
    ]
  end
end
