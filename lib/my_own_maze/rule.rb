class Rule
  def initialize(board)
    @board = board
  end

  def success?
    raise 'undefined success method'
  end

  def failed?
    raise 'undefined failed method'
  end
end
