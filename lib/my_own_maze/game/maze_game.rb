class MazeGame < Game

  def start
    @operation.print_maze
  end

  def success?
    @rule.success?(@player.x, @player.y)
  end

  def do(action)
    @operation.do(action)
  end

  def print_success
    @operation.print_maze
    @style.print_success(@maze.width/2, @maze.height/2)
  end

  private

  def init_game
    init_maze
    init_rule
    init_player
    init_style
    init_operation
  end

  def init_maze
    @maze = Object.const_get(@game_config['maze_type']).new(@game_config['width'], @game_config['height']).generate
  end
  
  def init_rule
    @rule = MazeRule.new(@maze)
  end

  def init_player
    @player = Point.new(@maze.start_point.x, @maze.start_point.y)
  end

  def init_style
    @style = MazeDisplay.new(Object.const_get("#{@game_config['maze_style']}Style").new)
  end

  def init_operation
    @operation = MazeOperation.new(@maze, @player, @rule, @style)
  end
end
