class OrientationFactory

  def self.get_orientation(orientation)
    case orientation.to_s
      when 'N' then North.instance
      when 'S' then South.instance
      when 'E' then East.instance
      when 'W' then West.instance
      else raise UndefinedOrientation
    end
  end
end