class Operation
  def initialize(maze, player, rule, style)
    @maze = maze
    @player = player
    @rule = rule
    @style = style
  end

  def do(action)
    raise "undefined do(#{action}) method"
  end
end
