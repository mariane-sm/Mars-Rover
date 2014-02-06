	require_relative 'mars_rover_input_reader'
  require_relative 'rover'
  require_relative 'plateau'
  require_relative 'mars_rovers_and_plateau_initial_settings'
  require_relative 'orientation_factory'
  require_relative 'north'
  require_relative 'south'
  require_relative 'west'
  require_relative 'east'

  initial_settings = MarsRoverInputReader.new.read("input.txt")

  count = 0
  initial_settings.rovers.each do |rover|
    rovers_moves = initial_settings.rovers_moves[count]
    count = count + 1
    rover.execute_moves(rovers_moves)
    rover.show()
  end