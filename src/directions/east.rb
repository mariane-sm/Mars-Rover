require "singleton"

class East

  include Singleton

  def execute_move(move, rover)
    if move == 'R'
      return South.instance
    elsif move == 'L'
      return North.instance
    else
      rover.current_x = rover.current_x.to_i + 1
      return self
    end
  end

  def to_s
    return 'E'
  end
end