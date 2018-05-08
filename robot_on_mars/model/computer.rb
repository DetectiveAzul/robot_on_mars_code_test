require_relative('grid')
require_relative('robot')

class Computer
  attr_accessor :grid, :robots, :outputs

  def initialize()
    @robots = Array.new
    @outputs = Array.new
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
      robot.execute_instructions(@grid)
      @output << robot.get_output
    end
  end

  def get_user_input()
    user_input = gets.chomp
    user_input = user.input.split(" ")
  end

  def get_user_input_for_grid()
    user_input = get_user_input()
    create_grid(user_input[0], user_input[1])
  end

  def get_user_input_for_robot()
    user_input = get_user_input()
    send_robot([user_input[0], user_input[1]], user_input[2], user_input[3])
  end
end
