class MazeStyle < Style

  def print_p(points)
    print "\e[H"
    points.each do |point|
      print_point(point)
    end
  end

  private
  def print_point(point)
    style = send("#{point.type}_style")
    style[:value].each_with_index do |v, idx|
      line = point.y * style[:height] + idx + 1
      column = point.x * style[:width] + 1
      print "\e[#{line};#{column}H#{v}"
    end
  end

  def player_style
    {
      width: 3,
      height: 2,
      value: [
        ' O ',
        '/> '
      ]
    }
  end

  def wall_style
    {
      width: 3,
      height: 2,
      value: [
        '   '.bg_brown,
        '   '.bg_brown
      ]
    }
  end

  def end_point_style
    road_style
  end

  def road_style
    {
      width: 3,
      height: 2,
      value: [
        ' - ',
        ' - '
      ]
    }
  end
end
