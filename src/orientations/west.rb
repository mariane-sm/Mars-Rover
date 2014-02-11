require "singleton"

class West

  include Singleton

  def execute(command)
    if command == 'R'
      return North.instance
    elsif command == 'L'
      return South.instance
    else 
      raise UnknowCommand, command.to_s + " is invalid for West orientation" 
    end
  end

  def to_s
    return "W"
  end
end