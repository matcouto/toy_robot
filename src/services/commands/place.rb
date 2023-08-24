# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
module Commands
  class Place < Base
    include CustomExceptions

    def call(command)
      position_direction_args = command.split(' ').last
      x_axis, y_axis, direction = position_direction_args.split(',')
      new_position = Position.new(x_axis.to_i, y_axis.to_i)
      validate_position(new_position)

      @robot.position = new_position
      @robot.direction = direction
    end

    private

    def validate_position(position)
      validate_position_format(position)
      validate_position_within_bounds(position)
    end

    def validate_position_format(position)
      raise PositionInvalidError, position unless position.valid?
    end

    def validate_position_within_bounds(position)
      raise PositionOutOfBoundsError, position unless position_within_bounds?(position)
    end
  end
end
