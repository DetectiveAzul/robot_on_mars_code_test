require('minitest/autorun')
require('minitest/rg')
require_relative('../model/robot')

class RobotTest < MiniTest::Test
  def setup()
    @robot01 = Robot.new([0,5], "N")
    @robot02 = Robot.new([10,15], "W")
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
    robot01.turn_left
    assert_equal("W", @robot01.get_facing)
  end

  def test_can_turn_right()
    robot02.turn_right
    assert_equal("N", @robot02.get_facing)
  end

  def test_can_move_forward()
    robot01.move_forward()
    robot02.move_forward()
    assert_equal(6, @robot01.get_y)
    assert_equal(9, @robot02.get_x)
  end

end
