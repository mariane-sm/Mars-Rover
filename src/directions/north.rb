class North
  def execute_move(move, rover)
    if move == 'R'
      return East.new
    elsif move == 'L'
      return West.new
    else 
      rover.current_y = rover.current_y.to_i + 1
      return self
    end
  end

  def to_s()
    return 'N'
  end
end