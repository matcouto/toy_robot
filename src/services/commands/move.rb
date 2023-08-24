# frozen_string_literal: true

require './src/services/commands/base'
module Commands
  class Move < Base
    def call(_command = nil)
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
