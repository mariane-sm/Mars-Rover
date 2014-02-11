class MarsRoverInputReader

  attr_reader :plateau, :commands

  DIGITS_SPACE_DIGITS = /^[\d]+ [\d]+$/
  DIGITS_SPACE_DIGITS_ORIENTATION = /^[\d]+ [\d]+ [N|S|W|E]$/
  COMMANDS = /[M|L|R]+/
  ORIENTATION = /(N|S|W|E)/

	def read(file_path)
    
    @commands = Hash.new
    rovers = Array.new
    commands = Array.new
    plateau_size = [0, 0]

		File.open(file_path).each do |line|
      if line =~ DIGITS_SPACE_DIGITS
        plateau_size = line.scan(/\d+/)
      elsif line =~ DIGITS_SPACE_DIGITS_ORIENTATION
        rovers.push(create_rover(line))
      elsif line =~ COMMANDS
        @commands[rovers.last] = line.delete("\n")
      else
        raise OutOfPatternInputLine, "Invalid line: "
      end
  	end
    @plateau = create_plateau(plateau_size[0], plateau_size[1], rovers)
    return self
	end

  def create_plateau(plateu_max_x, plateau_max_y, rovers)
    return Plateau.new(plateu_max_x, plateau_max_y, rovers)
  end

  def create_rover(line)
    position = line.scan(/\d+/)
    orientation = line.scan(ORIENTATION)
    return Rover.new(position[0].to_i, position[1].to_i, OrientationFactory.get_orientation(orientation[0][0]))
  end

  private :create_plateau, :create_rover
end	