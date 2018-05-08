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
end
