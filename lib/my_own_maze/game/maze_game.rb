class MazeGame < Game
  def initialize(level = 1)
    read_maze_map(level)
    super(level)
  end

  private
  def read_maze_map(level)
    map = YAML.load(File.read(File.expand_path('../../../../config/maze.yml', __FILE__)))
    raise "undefined level #{level}" unless map[level]
    @maze_map = map[level]
    @width = @maze_map['map'].size
    @height = @maze_map['map'][0].size
  end

  def init_player
    @player = Player.new(@maze_map['start_point'][0], @maze_map['start_point'][1])
  end

  def init_board
    points = []
    @maze_map['map'].each_with_index do |row, x|
      row.each_with_index do |cell, y|
        if @player.x == x && @player.y == y
          type = 'player'
        else
          type = cell == 0 ? 'road' : 'wall'
        end
        points << Point.new(x, y, type)
      end
    end
    @board = Board.new(@width, @height, points)
  end
  
  def init_rule
    end_point = Point.new(@maze_map['end_point'][0], @maze_map['end_point'][1], 'road')
    @rule = MazeRule.new(@board, @player, end_point)
  end

  def init_operation
    @operation = MazeOperation.new(@board, @player, @rule)
  end

  def init_display
    @style = MazeDisplay.new(@board)
  end
end
