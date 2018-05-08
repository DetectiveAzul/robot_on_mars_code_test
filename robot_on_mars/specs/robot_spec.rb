require('minitest/autorun')
require('minitest/rg')
require_relative('../model/robot')
require_relative('../model/grid')

class RobotTest < MiniTest::Test
  def setup()
    @robot01 = Robot.new([0,5], "N")
    @robot02 = Robot.new([10,15], "W")
    @grid = Grid.new(50, 50)
  end

  def test_has_x_coordinate()
    assert_equal(0, @robot01.get_x)
    assert_equal(10, @robot02.get_x)
  end

  def test_has_y_coordinate()
    assert_equal(5, @robot01.get_y)
    assert_equal(15, @robot02.get_y)
  end

  def test_has_coordinates()
    assert_equal([0,5], @robot01.get_coordinates)
  end

  def test_has_facing()
    assert_equal("N", @robot01.get_facing)
  end

  def test_can_turn_left()
    @robot01.turn_left
    assert_equal("W", @robot01.get_facing)
  end

  def test_can_turn_right()
    @robot02.turn_right
    assert_equal("N", @robot02.get_facing)
  end

  def test_can_move_forward()
    @robot01.move_forward()
    @robot02.move_forward()
    assert_equal(6, @robot01.get_y)
    assert_equal(9, @robot02.get_x)
  end

  def test_has_instructions()
    assert_nil(@robot01.instructions)
  end

  def test_can_execute_instruction()
    @robot01.execute_instruction("f")
    @robot01.execute_instruction("R")
    @robot01.execute_instruction("F")
    assert_equal(6, @robot01.get_y)
    assert_equal(1, @robot01.get_x)
  end

  def test_can_set_and_run_instructions()
    @robot01.set_instructions("FRF")
    @robot01.execute_instructions(@grid)
    assert_equal(6, @robot01.get_y)
    assert_equal(1, @robot01.get_x)
  end

  def test_robot_is_not_lost()
    assert_equal(false, @robot01.lost)
  end

  def test_robot_has_last_seen()
    @robot01.execute_instruction("f")
    assert_equal([0,5], @robot01.last_seen)
  end

  def test_robot_can_be_lost()
    @robot01.is_lost()
    assert_equal(true, @robot01.lost)
  end

  def test_robot_stops_working_if_lost()
    @robot01.is_lost()
    @robot01.execute_instruction("f")
    assert_equal([0,5], @robot01.get_coordinates)
  end

  def test_robot_exits_grid()
    new_robot = Robot.new([50, 50], "N")
    new_robot.set_instructions("fff")
    new_robot.execute_instructions(@grid)
    assert_equal(true, new_robot.lost)
  end


end
