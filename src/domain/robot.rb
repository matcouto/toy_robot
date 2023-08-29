# frozen_string_literal: true

require './src/util/custom_exceptions'
require './src/util/valid_directions'

class Robot
  include CustomExceptions
  include ValidDirections

  def initialize
    @position = nil
    @direction = ''
  end

  attr_accessor :position
  attr_reader :direction

  def direction=(new_direction)
    validate_direction(new_direction)

    @direction = new_direction
  end

  def current_position
    raise CustomExceptions::RobotNotPlacedError unless placed?

    "#{position.current.join(',')},#{direction}"
  end

  def placed?
    !position.nil? && !direction.empty?
  end

  private

  def validate_direction(new_direction)
    return if DIRECTIONS.include?(new_direction)

    raise CustomExceptions::DirectionInvalidError, new_direction
  end
end
