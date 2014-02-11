require "singleton"

class North

  include Singleton

  def execute(command)
    if command == 'R'
      return East.instance
    elsif command == 'L'
      return West.instance
    else 
      raise UnknowCommand, command.to_s + " is invalid for North orientation" 
    end
  end

  def to_s
    return "N"
  end
end