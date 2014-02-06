class MarsRoverInputReader

  def initialize()
    @rovers = Array.new
    @rovers_moves = Array.new
    @orientation_factory = OrientationFactory.new
  end

  #TODO: do not use odd or even for lines
	def read(file_path)
    line_counter = 1
		File.open(file_path).each do |line|
        if line_counter == 1
          read_plateau_size(line)
        elsif line_counter.even?
          read_rover_initial_position_and_orientation(line)
        elsif line_counter.odd? 
          read_rover_movements(line)
        else
          #TODO: Throw exception
          print "Not possible to read line: " + line
        end
        line_counter = line_counter + 1
        puts line
  	end
    return MarsRoversAndPlateauInitialSettings.new(@plateau, @rovers, @rovers_moves)
	end

  def read_plateau_size(line)
    plateau_size = line.scan(/\d+/)
     @plateau = Plateau.new(plateau_size[0], plateau_size[1]) 
  end

  def read_rover_initial_position_and_orientation(line)
    rover_position = line.scan(/\d+/)
    rover_orientation = line.scan(/(N|S|W|E)/)
    rover = Rover.new(rover_position[0], rover_position[1], @orientation_factory.convert(rover_orientation[0][0].to_s))
    @rovers.push(rover)
  end

  def read_rover_movements(line)
    @rovers_moves.push(line)
  end

  private :read_plateau_size, :read_rover_initial_position_and_orientation, :read_rover_movements
end	