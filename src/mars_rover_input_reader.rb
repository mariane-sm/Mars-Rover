require "singleton"

class MarsRoverInputReader

  include Singleton

  attr_reader :plateau, :commands

  #TODO: do not use odd or even for lines, use pattern matching
	def read(file_path)
    
    @commands = Hash.new

    rovers = Array.new
    commands = Array.new
    plateau_size = [0, 0]

    line_counter = 1
		File.open(file_path).each do |line|
      if line_counter == 1
        plateau_size = line.scan(/\d+/)
      elsif line_counter.even?
        rovers.push(create_rover(line))
      elsif line_counter.odd? 
        @commands[rovers.last] = line.delete("\n")
      else
        raise OutOfPatternInputLine, "Invalid line: "
      end
      line_counter = line_counter + 1
  	end
    @plateau = create_plateau(plateau_size[0], plateau_size[1], rovers)

    return self
	end

  def create_plateau(plateu_max_x, plateau_max_y, rovers)
    @plateau = Plateau.new(plateu_max_x, plateau_max_y, rovers)
  end

  def create_rover(line)
    position = line.scan(/\d+/)
    orientation = line.scan(/(N|S|W|E)/)
    return Rover.new(position[0].to_i, position[1].to_i, DirectionFactory.instance.get_direction(orientation[0][0]))
  end

  private :create_plateau, :create_rover
end	