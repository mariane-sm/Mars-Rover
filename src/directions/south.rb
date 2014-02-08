require "singleton"

class South

  include Singleton

  def execute(command)
    if command == 'R'
      return West.instance
    elsif command == 'L'
      return East.instance
    else 
      puts 'Error!!!'
    end
  end

  def to_s
    return 'S'
  end
end