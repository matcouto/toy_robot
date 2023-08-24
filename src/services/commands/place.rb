# frozen_string_literal: true

require './src/services/commands/base'

module Commands
  class Place < Base
    def call(command)
      position_direction_args = command.split(' ').last
      x_axis, y_axis, direction = position_direction_args.split(',')

      @robot.position = Position.new(x_axis.to_i, y_axis.to_i)
      @robot.direction = direction
    end
  end
end
