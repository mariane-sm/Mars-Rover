	require_relative 'mars_rover_input_reader'
  require_relative 'rover'
  require_relative 'plateau'

  require_relative 'directions/direction_factory'
  require_relative 'directions/north'
  require_relative 'directions/south'
  require_relative 'directions/west'
  require_relative 'directions/east'

 require_relative 'exceptions/unknown_command'
 require_relative 'exceptions/out_of_pattern_input_line'

  #TODO: MAKE TESTS !!!

  #"../input.txt"
  reader = MarsRoverInputReader.instance.read(ARGV[0])
  plateau = reader.plateau
  commands = reader.commands

  puts puts plateau.to_s

  plateau.get_rovers_enum.each do |rover|
    rover.execute_commands(commands[rover])
  end

  puts plateau.to_s
