require "singleton"

class West

  include Singleton

  def execute_move(move, rover)
    if move == 'R'
      return North.instance
    elsif move == 'L'
      return South.instance
    else 
      rover.current_x = rover.current_x.to_i - 1
      return self
    end
  end

  def to_s
    return 'W'
  end
end