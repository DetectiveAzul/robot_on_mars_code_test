require('minitest/autorun')
require('minitest/rg')
require_relative('../model/grid')

class GridTest < MiniTest::Test
  def setup()
    @mars = Grid.new(30, 20)

  end

  def test_has_top_x()
    assert_equal(30, @mars.get_top_x)
  end

  def test_has_top_y()
    assert_equal(20, @mars.get_top_y)
  end

  def test_has_scent_array()
    assert_equal(0, @mars.scents.size)
  end

end
