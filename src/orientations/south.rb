require "singleton"

class South

  include Singleton

  def execute(command)
    if command == 'R'
      return West.instance
    elsif command == 'L'
      return East.instance
    else 
      raise UnknowCommand, command.to_s + " is invalid for South orientation" 
    end
  end

  def to_s
    return "S"
  end
end