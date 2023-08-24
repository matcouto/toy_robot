# frozen_string_literal: true

require './src/services/commands/base'
require './src/util/custom_exceptions'
require './src/util/valid_directions'
module Commands
  class Rotate < Base
    include ValidDirections
    include CustomExceptions

    ROTATIONS = %w[LEFT RIGHT].freeze

    def call(command)
      raise CommandInvalidError, command unless ROTATIONS.include?(command.upcase)

      current_direction_index = DIRECTIONS.index(@robot.direction)
      pointer = command.upcase.match(/LEFT/) ? -1 : 1
      new_direction = DIRECTIONS.rotate(pointer)[current_direction_index]
      @robot.direction = new_direction
    end
  end
end
