	require_relative 'mars_rover_input_reader'
  require_relative 'rover'
  require_relative 'plateau'

  require_relative 'orientations/orientation_factory'
  require_relative 'orientations/north'
  require_relative 'orientations/south'
  require_relative 'orientations/west'
  require_relative 'orientations/east'

 require_relative 'exceptions/unknown_command'
 require_relative 'exceptions/out_of_pattern_input_line'
 require_relative 'exceptions/rover_with_undefined_orientation'

  #TODO: MAKE TESTS !!!

  reader = MarsRoverInputReader.new.read(ARGV[0])
  plateau = reader.plateau
  commands = reader.commands

  puts puts plateau.to_s

  plateau.get_rovers_enum.each do |rover|
    rover.execute_commands(commands[rover])
  end

  puts plateau.to_s
