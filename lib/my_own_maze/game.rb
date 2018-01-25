class Game
  attr_accessor :level, :player, :board, :rule, :operation, :style

  def initialize(level = 1)
    @level = level
    init_player
    init_board
    init_rule
    init_operation
    init_display
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

  def init_display
    raise 'undefined init_display method'
  end
end
