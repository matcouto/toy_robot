# frozen_string_literal: true

require './src/domain/robot'
require './src/domain/position'

class Robot
  def initialize
    @position = Position.new(0, 0)
    @direction = 'NORTH'
  end

  def current_position
    "#{position.current},#{direction}"
  end

  attr_accessor :position, :direction
end
