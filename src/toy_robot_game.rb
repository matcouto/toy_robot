class ToyRobotGame
  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def process(command)
    # TODO: Create custom exception for process
    case command.upcase
    when /PLACE/
      place(command)
    when /MOVE/
      move
    when /LEFT/, /RIGHT/
      rotate(command)
    when /REPORT/
      report
    end
  end

  def move
    # TODO: Create custom exception for move

    robot.move
  end

  def place(command)
    # TODO: Create custom exception for place - Nested exceptions
    coordination = command.split(' ')[1]
    x_axis, y_axis, direction = coordination.split(',')
    robot.position = Position.new(x_axis.to_i, y_axis.to_i)
    robot.direction = direction
  end

  def rotate(command)
    # TODO: Create custom exception for rotate
    case command.upcase
    when /LEFT/
      robot.rotate_anticlockwise
    when /RIGHT/
      robot.rotate_clockwise
    end
  end

  def report
    # TODO: Create custom exception for report
    robot.current_position
  end

  private

  attr_accessor :table, :robot
end
# TODO: Validate if the next move is valid
# example: Robot is at [0, 0] facing WEST and the next move command would go out of bounds
