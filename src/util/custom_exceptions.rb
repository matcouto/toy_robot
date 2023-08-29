# frozen_string_literal: true

module CustomExceptions
  class CommandInvalidError < StandardError
    def initialize(command)
      super("Invalid command: #{command}")
    end
  end

  class DirectionInvalidError < StandardError
    def initialize(direction)
      super("Invalid direction: #{direction}")
    end
  end

  class PositionOutOfBoundsError < StandardError
    def initialize(position)
      super("Position [#{position.x_axis}, #{position.y_axis}] is outside bounds")
    end
  end

  class PositionInvalidError < StandardError
    def initialize(position)
      super("Position [#{position.x_axis}, #{position.y_axis}] is invalid")
    end
  end

  class RobotNotPlacedError < StandardError
    def initialize
      super('The robot has not been placed yet. Please place the robot first')
    end
  end
end
