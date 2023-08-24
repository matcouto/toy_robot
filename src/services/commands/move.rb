# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
module Commands
  class Move < Base
    include CustomExceptions

    def call(_command)
      raise PositionOutOfBoundsError, @robot.position unless position_within_bounds?(@robot.position)

      case @robot.direction
      when 'NORTH'
        @robot.position.y_axis += 1
      when 'EAST'
        @robot.position.x_axis += 1
      when 'SOUTH'
        @robot.position.y_axis -= 1
      when 'WEAST'
        @robot.position.x_axis -= 1
      end
    end
  end
end
