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

describe Rover do
  describe "Creation" do
    it "is initialized with correct constructor arguments" do
      rover = Rover.new(0, 0, North.instance)
      rover.x.should eql(0)
      rover.y.should eql(0)
      rover.orientation.should eql(North.instance)
    end
  end

  describe "Commands" do
    it "moves three times and stop at 0 3" do
      rover = Rover.new(0, 0, North.instance)
      rover.execute_commands('MMM')
      rover.x.should eql(0)
      rover.y.should eql(3)
      rover.orientation.should eql(North.instance)
    end

    it "MRMLL and stop at " do
      rover = Rover.new(0, 0, North.instance)
      rover.execute_commands('MRMLL')
      rover.x.should eql(1)
      rover.y.should eql(1)
      rover.orientation.should eql(West.instance)
    end

    it "raises RoverWithUndefinedOrientation when initialize orientation with string" do
      rover = Rover.new(0, 0, "N")
      expect { rover.execute_commands('MRMLL') }.to raise_error(RoverWithUndefinedOrientation)
    end 

    it "raises UnknownCommand when command is invalid" do
      rover = Rover.new(0, 0, North.instance)
      expect { rover.execute_commands('MMXM') }.to raise_error(UnknownCommand)
    end 
    
  end

end