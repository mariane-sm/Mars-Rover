class South
  def execute_move(move, rover)
    if move == 'R'
      return West.new
    elsif move == 'L'
      return East.new
    else 
      rover.current_y = rover.current_y.to_i - 1
      return self
    end
  end

  def print()
    return 'S'
  end
end