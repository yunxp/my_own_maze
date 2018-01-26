require 'io/console'
require 'yaml'
Dir["#{File.expand_path('../../lib/core_ext', __FILE__)}/*.rb"].each {|file| require file }
Dir["#{File.expand_path('../../lib/my_own_maze', __FILE__)}/*.rb"].each {|file| require file }
Dir["#{File.expand_path('../../lib/my_own_maze', __FILE__)}/**/*.rb"].each {|file| require file }

class MyOwnMaze
  def initialize(type)
    @level = 1
    @type = type
    init_game
  end

  def run
    loop do
      @game.print_p
      input = STDIN.getch
      exit if input == 'e'
      @game.do(input) if input != nil && input != ''
      success if @game.success?
    end
  rescue StandardError
    exit
  ensure
    print "\x1b[?25h" # show cursor
  end

  private
  def init_game
    @game = Object.const_get("#{@type}Game").new(@level)
    print "\033[0m" # reset
    print "\033[2J" # clear screen
    print "\x1B[?25l" # disable cursor
  end

  def success
    @game.print_p
    puts "success!!!"
    sleep 1
    @level = @level + 1
    init_game
  end
end
