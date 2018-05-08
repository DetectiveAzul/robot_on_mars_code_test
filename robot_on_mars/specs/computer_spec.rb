require('minitest/autorun')
require('minitest/rg')
require_relative('../model/computer')

class ComputerTest < MiniTest::Test
  def setup()
    @computer = Computer.new()
  end

  def test_can_create_grid()
    @computer.create_grid(50, 50)
    assert_equal(50, @computer.grid.get_top_x)
  end

  def test_can_send_robot()
    @computer.send_robot([0,0], "N", "FFF")
    assert_equal([0,0], @computer.robots.first.get_coordinates)
  end

  def test_send_and_execute_robots_instructions()
    @computer.send_robot([0,0], "N", "FFF")
    @computer.send_robot([1,0], "N", "FFF")
    @computer.execute_robots_instructions
    assert_equal([0,3], @computer.robots.first.get_coordinates)
    assert_equal([1,3], @computer.robots.last.get_coordinates)
  end

  def test_receive_scents_from_lost_robots()
    @computer.send_robot([0,0], "N", "FFF")
    @computer.robots.first.is_lost()
    @computer.execute_robots_instructions
    assert_equal(1, @computer.scents.size)
    assert_equal([0,0], @computer.scents.first)
  end
end
