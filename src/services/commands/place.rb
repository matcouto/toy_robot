# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
module Commands
  class Place < Base
    include CustomExceptions

    def call(command)
      x_axis, y_axis, direction = parse_place_command(command)
      new_position = Position.new(x_axis.to_i, y_axis.to_i)
      validate_new_position(new_position)

      @robot.position = new_position
      @robot.direction = direction
    end

    private

    def parse_place_command(command)
      position_direction_args = command.split(' ').last
      position_direction_args.split(',')
    end

    def validate_new_position(position)
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
