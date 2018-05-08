class Robot
  attr_accessor :instructions, :last_seen
  attr_reader :lost
  def initialize(coordinates, facing)
    @coordinates = {
      x: coordinates[0],
      y: coordinates[1]
    }

    @facing = facing
    @last_seen = get_coordinates
    @lost = false
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

  def set_coordinates(coordinates)
    @coordinates[:x] = coordinates[0]
    @coordinates[:y] = coordinates[1]
  end

  def set_instructions(instructions)
    @instructions = instructions.split('')
  end

  def execute_instructions(grid)
    @instructions.each do |instruction|
      execute_instruction(instruction)
      check_exits_grid(grid)
    end
  end

  def execute_instruction(instruction)
    if !@lost
      case(instruction.upcase)
        when "F" then move_forward
        when "L" then turn_left
        when "R" then turn_right
      end
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
    @last_seen = get_coordinates()
      case(@facing)
      when "N" then @coordinates[:y] += 1
      when "E" then @coordinates[:x] += 1
      when "S" then @coordinates[:y] -= 1
      when "W" then @coordinates[:x] -= 1
      end
  end

  def check_exits_grid(grid)
    if get_x < 0 || get_x > grid.get_top_x || get_y < 0 || get_y > grid.get_top_y
      if !lost && !grid.scents.include?(@last_seen)
        is_lost
        grid.scents << last_seen
      elsif !lost && grid.scents.include?(@last_seen)
        set_coordinates(@last_seen)
      end
    end
  end

  def is_lost()
    @lost = true;
  end


  def get_output()
    return "#{@coordinates[:x]} #{@coordinates[:y]} #{@facing}" if !lost
    return "#{@last_seen[0]} #{@last_seen[1]} #{@facing} LOST"
  end

end
