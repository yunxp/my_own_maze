class SimpleMazeStyle
  attr_reader :width, :height

  def initialize
    @width = 1
    @height = 1
  end

  def player_style
    ['P']
  end

  def wall_style
    ['='.bg_cyan]
  end

  def road_style
    [' ']
  end

  def result_style
    ['-']
  end
end
