class MazeGame < Game
  def initialize(level = 1)
    read_maze_map(level)
    super(level)
  end

  def success?
    @rule.success?(@player.x, @player.y)
  end

  def do(action)
    @operation.do(action)
  end

  def print_p
    @style.print_p(@board.points)
    @style.print_p([@player])
  end

  private
  def read_maze_map(level)
    map = YAML.load(File.read(File.expand_path('../../../../config/maze.yml', __FILE__)))
    raise "undefined level #{level}" unless map[level]
    @maze_map = map[level]
    @width = @maze_map['map'].size
    @height = @maze_map['map'][0].size
  end

  def init_board
    points = []
    @maze_map['map'].each_with_index do |row, x|
      row.each_with_index do |cell, y|
        type = cell == 0 ? 'road' : 'wall'
        type = 'end_point' if @maze_map['end_point'][0] == x && @maze_map['end_point'][1] == y
        points << Point.new(x, y, type)
      end
    end
    @board = Board.new(@width, @height, points)
  end
  
  def init_rule
    @rule = MazeRule.new(@board)
  end

  def init_player
    @player = Point.new(@maze_map['start_point'][0], @maze_map['start_point'][1], 'player')
  end

  def init_operation
    @operation = MazeOperation.new(@player, @rule)
  end

  def init_style
    @style = MazeStyle.new
  end
end
