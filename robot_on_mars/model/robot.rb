class Robot
  attr_accessor :instructions
  def initialize(coordinates, facing)
    @coordinates = {
      x: coordinates[0],
      y: coordinates[1]
    }

    @facing = facing
  end

  def get_x()
    return @coordinates[:x]
  end

  def get_y()
    return @coordinates[:y]
  end

  def get_facing()
    return @facing
  end

  def get_coordinates()
    coordinates = []
    @coordinates.each { |key, value| coordinates << value }
    return coordinates
  end

  def execute_instruction(instruction)
    case(instruction.upcase)
    when "F" then move_forward
    when "L" then turn_left
    when "R" then turn_right
    end
  end

  def turn_left()
    case(@facing)
    when "N" then @facing = "W"
    when "E" then @facing = "N"
    when "S" then @facing = "E"
    when "W" then @facing = "S"
    end
  end

  def turn_right()
    case(@facing)
    when "N" then @facing = "E"
    when "E" then @facing = "S"
    when "S" then @facing = "W"
    when "W" then @facing = "N"
    end
  end

  def move_forward()
    case(@facing)
    when "N" then @coordinates[:y] += 1
    when "E" then @coordinates[:x] += 1
    when "S" then @coordinates[:y] -= 1
    when "W" then @coordinates[:x] -= 1
    end
  end

end
