class Plateau
  
  attr_reader :max_x, :max_y

  def initialize(max_x, max_y, rovers)
    @max_x = max_x
    @max_y = max_y
    @rovers = rovers
  end

  def get_rovers_enum
    return @rovers.to_enum
  end

  def to_s
    output = "Max_X Max_Y: " + @max_x.to_s + " " + @max_y.to_s + "\n"
    @rovers.each do |rover|
      output = output + rover.to_s + "\n"
    end
    return output
  end
end