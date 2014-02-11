require_relative '../src/mars_rover_input_reader'
require_relative '../src/rover'
require_relative '../src/plateau'

require_relative '../src/orientations/orientation_factory'
require_relative '../src/orientations/north'
require_relative '../src/orientations/south'
require_relative '../src/orientations/west'
require_relative '../src/orientations/east'

require_relative '../src/exceptions/unknown_command'
require_relative '../src/exceptions/out_of_pattern_input_line'
require_relative '../src/exceptions/rover_with_undefined_orientation'

describe Plateau do
  describe "File Reading" do

    #it "reads plateau size" do
    #  reader = MarsRoverInputReader.new.read("input_test.txt")
    #  expected_plateau = Plateau.new(5, 4, nil)
    #  reader.plateau should eql(expected_plateau)
    #end

    it "raises OutOfPatternInputLine for file with letters for plateau size" do
      expect { MarsRoverInputReader.new.read("input_test_wrong.txt") }.to raise_error(OutOfPatternInputLine)
    end 

  end
end