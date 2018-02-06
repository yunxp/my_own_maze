class MazeStyle
  attr_reader :width, :height

  def initialize
    @width = 3
    @height = 2
  end

  def player_style
    [
      ' O ',
      '/> '
    ]
  end

  def wall_style
    [
      '==='.bg_cyan,
      '==='.bg_cyan
    ]
  end

  def road_style
    [
      '   ',
      '   '
    ]
  end

  def result_style
    [
      ' - ',
      ' - '
    ]
  end
end
