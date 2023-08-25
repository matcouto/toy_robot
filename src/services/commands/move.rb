# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
require './src/util/valid_directions'
module Commands
  class Move < Base
    include CustomExceptions
    include ValidDirections

    def call(_command)
      current_position = @robot.position.clone
      set_position_according_to_direction

      return if position_within_bounds?(@robot.position)

      rollback_move(current_position, @robot.position)
    end

    private

    def set_position_according_to_direction
      x_change, y_change = calculate_direction_change
      @robot.position.x_axis += x_change
      @robot.position.y_axis += y_change
    end

    def calculate_direction_change
      case @robot.direction
      when DIRECTIONS_MAP[:north]
        [0, 1]
      when DIRECTIONS_MAP[:east]
        [1, 0]
      when DIRECTIONS_MAP[:south]
        [0, -1]
      when DIRECTIONS_MAP[:west]
        [-1, 0]
      end
    end

    def rollback_move(current_position, invalid_position)
      @robot.position = current_position
      raise PositionOutOfBoundsError, invalid_position
    end
  end
end
