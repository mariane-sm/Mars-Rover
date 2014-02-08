class West
  def execute_move(move, rover)
    if move == 'R'
      return North.new
    elsif move == 'L'
      return South.new
    else 
      rover.current_x = rover.current_x.to_i - 1
      return self
    end
  end

  def to_s()
    return 'W'
  end
end