class Rover

  attr_reader :x, :y, :orientation

	def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def execute_commands(commands)
    commands.split("").each do |command|
      if command == 'L' || command == 'R'
        change_direction(command)
      elsif command == 'M'
        move(command)
      else
        puts 'Error !!!'
      end
    end
  end

  def change_direction(command)
    @orientation = @orientation.execute(command)
  end

  #Use CASE!!!
  def move(command)
    if @orientation == South.instance
      y = y - 1
    elsif @orientation == North.instance
      y = y + 1
    elsif @orientation == West.instance
      x = x - 1
    elsif @orientation == East.instance
      x = x + 1
    else
      puts 'Error !!!'
    end
  end

  def to_s()
    puts @x.to_s + " " + @y.to_s + " " + @orientation.to_s
  end

  private :change_direction, :move
end