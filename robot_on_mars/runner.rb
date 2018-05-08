require_relative('model/computer')

##Initialize the computer control program
computer = Computer.new()

##Output instructions
puts "Welcome to Mars Rover Control System Simulator"
puts "Please input the maximum size of the Mars grid by introducing max X and Y coordinates separates by an space.

For example: 10 10"

##Get User Input for Grid Size
computer.get_user_input_for_grid
puts "Your Mars grid is #{computer.grid.get_top_x} by #{computer.grid.get_top_y}"
puts ""

##Get User Input for Robots
not_enough_robots = true
while(not_enough_robots)
  puts "Please, introduce Robot initial coordinates, facing and set of instructions

  For example: 10 5 N FFRFFLRR"
  computer.get_user_input_for_robot
  puts "Do you want to send additional robots? (y/n)"
  case gets.chomp.downcase
  when "n" then not_enough_robots = false
  end
end

computer.execute_robots_instructions
computer.outputs.each do |output|
  puts output
  puts ""
end
