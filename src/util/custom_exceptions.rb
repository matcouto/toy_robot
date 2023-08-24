# frozen_string_literal: true

module CustomExceptions
  class CommandInvalidError < StandardError
    def initialize(command)
      puts "Invalid command: #{command}"
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
      super("Position [#{position.x_axis}, #{position.y_axis}] is out of bounds")
    end
  end

  class PositionInvalidError < StandardError
    def initialize(position)
      super("Position [#{position.x_axis}, #{position.y_axis}] is invalid")
    end
  end
end
