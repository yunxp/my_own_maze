class Board
  attr_accessor :points, :end_point, :player
  def initialize(map, end_point, player)
    @width = map.size
    @height = map[0].size
    @end_point = end_point
    @player = player
    init_point(map)
  end

  def find_point(x, y)
    @points.find { |point| point.x == x && point.y == y }
  end

  def to_s
    str = ''
    (0...@height).each do |y|
      row_values = []
      (0...@width).each do |x|
        if @player.is_here?(x, y)
          value = player_style
        else
          value = find_point(x, y).is_wall? ? wall_style : road_style
        end
        row_values << value
      end
      str += print_row(row_values) + "\n"
    end
    str
  end

  private
  def init_point(map)
    @points = []
    map.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        @points << Point.new(x, y, cell)
      end
    end
  end

  def print_row(row_values)
    str = ''
    (0..1).each do |idx|
      row_values.each do |value|
        str += value[idx]
      end
      str += "\n"
    end
    str.chomp
  end

  def player_style
    [
      ' O ',
      '/> '
    ]
    # 'O/'
  end

  def wall_style
    [
      '   '.bg_brown,
      '   '.bg_brown
    ]
    # '  '.bg_brown
  end

  def road_style
    [
      ' - ',
      ' - '
    ]
    # '  '
  end
end
