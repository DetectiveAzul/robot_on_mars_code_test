class Computer
  attr_accessor :grid :robots

  def initialize()
  end

  def create_grid(top_x, top_y)
    @grid = Grid.new(top_x, top_y)
  end

  def send_robot(coordinates, facing, instructions)
    new_robot = Robot.new(coordinates, facing)
    new_robot.set_instructions(instructions)
  end


end
