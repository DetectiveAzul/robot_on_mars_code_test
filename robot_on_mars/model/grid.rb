class Grid
  attr_accessor :robots, :scents
  def initialize(top_x, top_y)
    @top_x = top_x
    @top_y = top_y
  end

  def get_top_x
    return @top_x
  end

  def get_top_y
    return @top_y
  end

end
