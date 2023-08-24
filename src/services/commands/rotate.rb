# frozen_string_literal: true

require './src/services/commands/base'
module Commands
  class Rotate < Base
    CARDINAL_POINTS = %w[NORTH EAST SOUTH WEST].freeze

    def call(command)
      # TODO: Create custom exception for rotate
      current_direction_index = CARDINAL_POINTS.index(@robot.direction)
      pointer = command.upcase.match(/LEFT/) ? -1 : 1
      new_direction = CARDINAL_POINTS.rotate(pointer)[current_direction_index]
      @robot.direction = new_direction
    end
  end
end
