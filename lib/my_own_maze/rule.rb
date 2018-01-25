class Rule
  def initialize(board, player)
    @board = board
    @player = player
  end

  def success?
    raise 'undefined success method'
  end

  def failed?
    raise 'undefined failed method'
  end

  def can_do?(type)
    send("can_do_#{type}?")
  end

  def method_missing(name, *args, &block)
    return false if name.to_s.include?('can_do_')
  end
end
