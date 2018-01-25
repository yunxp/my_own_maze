require 'io/console'
require 'yaml'
Dir["#{File.expand_path('../../lib', __FILE__)}/**/*.rb"].each {|file| require file }

class MyOwnMaze
  KEYS = {
    'w' => 'up',
    's' => 'down',
    'a' => 'left',
    'd' => 'right'
  }

  def initialize
    @level = 1
    init_board
  end

  def run
    loop do
      print_board
      input = STDIN.getch
      exit if input == 'e'
      @walk.send("go_#{KEYS[input]}") if input != nil && input != '' && KEYS[input] != nil
      success if @walk.success?
    end
  end

  private
  def init_board
    maze_map = init_map
    player = Player.new(maze_map['start_point'][0], maze_map['start_point'][1])
    end_point = Point.new(maze_map['end_point'][0], maze_map['end_point'][1], 0)
    board = Board.new(maze_map['map'], end_point, player)
    @walk = Walk.new(board)
    print "\033[0m" # reset
    print "\033[2J" # clear screen
    # print "\x1B[?25l" # disable cursor
  end

  def success
    print_board
    puts "success!!!"
    sleep 1
    @level = @level + 1
    init_board
  end

  def print_board
    print "\e[H"
    # print "\033[0m"
    print "level #{@level}\n\n".green
    print @walk.board.to_s
  end

  def init_map
    maze_map = YAML.load(File.read("config/maze.yml"))
    exit unless maze_map[@level]
    maze_map[@level]
  end
end
