class Operation
  def initialize(player, rule)
    @player = player
    @rule = rule
  end

  def do(action)
    raise "undefined do(#{action}) method"
  end
end
