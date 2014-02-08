require "singleton"

class North

  include Singleton

  def execute_move(move, rover)
    if move == 'R'
      return East.instance
    elsif move == 'L'
      return West.instance
    else 
      rover.current_y = rover.current_y.to_i + 1
      return self
    end
  end

  def to_s
    return 'N'
  end
end