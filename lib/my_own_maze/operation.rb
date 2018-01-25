class Operation
  def initialize(board, player, rule)
    @board = board
    @player = player
    @rule = rule
  end

  def do_operation(type)
    flag = @rule.can_do?(type)
    send("do_#{type}") if @rule.can_do?(type)
  end

  def method_missing(name, *args, &block)
    
  end
end
