class OrientationFactory
  def convert(orientation)
    if orientation == 'N' || orientation == "N"
      return North.new
    elsif orientation == 'S' || orientation == "S"
      return South.new
    elsif orientation == 'E' || orientation == "E"
      return East.new
    elsif orientation == 'W' || orientation == "W"
      return West.new
    end
  end
end