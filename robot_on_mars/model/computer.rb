require_relative('grid')
require_relative('robot')

class Computer
  attr_accessor :grid, :robots, :scents

  def initialize()
    @robots = Array.new
    @scents = Array.new
  end

  def create_grid(top_x, top_y)
    @grid = Grid.new(top_x, top_y)
  end

  def send_robot(coordinates, facing, instructions)
    new_robot = Robot.new(coordinates, facing)
    new_robot.set_instructions(instructions)
    @robots << new_robot
  end

  def execute_robots_instructions()
    @robots.each do |robot|
      robot.execute_instructions
      @scents << robot.last_seen if robot.lost
    end
  end

end
