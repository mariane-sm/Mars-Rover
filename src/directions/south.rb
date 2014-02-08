require "singleton"

class South

  include Singleton

  def execute_move(move, rover)
    if move == 'R'
      return West.instance
    elsif move == 'L'
      return East.instance
    else 
      rover.current_y = rover.current_y.to_i - 1
      return self
    end
  end

  def to_s
    return 'S'
  end
end