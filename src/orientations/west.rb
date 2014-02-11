require "singleton"

class West

  include Singleton

  def execute(command)
    if command == 'R'
      return North.instance
    elsif command == 'L'
      return South.instance
    else 
      puts 'Error !!!'
    end
  end

  def to_s
    return "W"
  end
end