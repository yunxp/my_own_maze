class Game
  attr_accessor :level

  def initialize(level = 1)
    @level = level
    init_board
    init_rule
    init_player
    init_operation
    init_style
  end

  private
  def init_player
    raise 'undefined init_player method'
  end

  def init_board
    raise 'undefined init_board method'
  end

  def init_rule
    raise 'undefined init_rule method'
  end

  def init_operation
    raise 'undefined init_operation method'
  end

  def init_style
    raise 'undefined init_style method'
  end
end
