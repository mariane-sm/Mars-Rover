	require_relative 'mars_rover_input_reader'
  require_relative 'rover'
  require_relative 'plateau'

  require_relative 'directions/direction_factory'
  require_relative 'directions/north'
  require_relative 'directions/south'
  require_relative 'directions/west'
  require_relative 'directions/east'

  initial_settings = MarsRoverInputReader.instance.read("../input.txt")

  count = 0
  initial_settings.rovers.each do |rover|
    rovers_moves = initial_settings.rovers_moves[count]
    count = count + 1
    rover.execute_moves(rovers_moves)
    rover.show()
  end