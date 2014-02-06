class MarsRoversAndPlateauInitialSettings
  
  attr_reader :plateau, :rovers, :rovers_moves

  def initialize(plateau, rovers, rovers_moves)
    @plateau = plateau
    @rovers = rovers
    @rovers_moves = rovers_moves
  end
end