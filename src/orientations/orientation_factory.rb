class OrientationFactory

  def self.get_orientation(orientation)
    if orientation == 'N'
      return North.instance
    elsif orientation == 'S'
      return South.instance
    elsif orientation == 'E'
      return East.instance
    elsif orientation == 'W'
      return West.instance
    end
  end
end