require "singleton"

class East

  include Singleton

  def execute(command)
    if command == 'R'
      return South.instance
    elsif command == 'L'
      return North.instance
    else
      raise UnknowCommand, command.to_s + " is invalid for East orientation" 
    end
  end

  def to_s
    return "E"
  end
end