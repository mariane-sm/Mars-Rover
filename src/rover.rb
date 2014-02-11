class Rover

  attr_reader :x, :y, :orientation

	def initialize(x, y, orientation)
    @x = x.to_i
    @y = y.to_i
    @orientation = orientation
  end

  def execute_commands(commands)
    commands.split("").each do |command|
      if is_direction(command)
        change_direction(command)
      elsif is_move(command)
        move
      else
        raise UnknownCommand, command.to_s + " is invalid"
      end
    end
  end

  def is_direction(command)
    command == 'L' || command == 'R'
  end

  def change_direction(command)
    @orientation = @orientation.execute(command)
  end

  def is_move(command)
    command == 'M'
  end

  def move
    case @orientation
      when South.instance then @y = @y - 1
      when North.instance then @y = @y + 1
      when West.instance then @x = @x - 1
      when East.instance then @x = @x + 1
      else raise UndefinedOrientation
    end  
  end

  def to_s
    "X Y Orientation: " + @x.to_s + " " + @y.to_s + " " + @orientation.to_s
  end

  private :is_direction, :change_direction, :is_move, :move
end