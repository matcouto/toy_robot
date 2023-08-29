# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
require './src/util/valid_directions'
module Commands
  class Rotate < Base
    include ValidDirections
    include CustomExceptions

    ROTATIONS = %w[LEFT RIGHT].freeze
    LEFT_ROTATION = -1
    RIGHT_ROTATION = 1

    def call(command)
      raise CommandInvalidError, command unless ROTATIONS.include?(command)

      current_direction_index = DIRECTIONS.index(@robot.direction)
      pointer = command.match(/LEFT/) ? LEFT_ROTATION : RIGHT_ROTATION
      new_direction = DIRECTIONS.rotate(pointer)[current_direction_index]
      @robot.direction = new_direction
    end
  end
end
