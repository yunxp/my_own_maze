require 'yaml'

class Game
  attr_accessor :level

  def initialize(level = 1)
    @level = level
    set_config
    init_game
  end

  def start
    raise 'undefined start method'
  end

  def success?
    raise 'undefined success? method'
  end

  def do(action)
    raise "undefined do(#{action}) method"
  end

  def print_success
    raise 'undefined print_success method'
  end

  private
  def set_config
    @game_config = YAML.load(File.read(File.expand_path('../../../config/game.yml', __FILE__)))[self.class.name]
  end

  def init_game
    raise 'undefined init_game method'
  end
end
