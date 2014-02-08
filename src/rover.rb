class Rover

  attr_accessor :current_x, :current_y, :orientation

	def initialize(current_x, current_y, orientation)
    @current_x = current_x
    @current_y = current_y
    @orientation = orientation
  end

  def execute_moves(moves)
    moves.split("").each do |move|
      make_move(move)
    end
  end

  def make_move(move)
    @orientation = @orientation.execute_move(move, self)
  end

  def show()
    puts @current_x.to_s + " " + @current_y.to_s + " " + @orientation.to_s
  end
end