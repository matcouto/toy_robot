# frozen_string_literal: true

require './src/robot'
require './src/position'
require 'byebug'

class Robot
  def initialize
    @position = Position.new(0, 0)
    @direction = 'NORTH'
  end

  def move
    case direction
    when 'NORTH'
      position.y_axis += 1
    when 'EAST'
      position.x_axis += 1
    when 'SOUTH'
      position.y_axis -= 1
    when 'WEAST'
      position.x_axis -= 1
    end
  end

  def rotate_anticlockwise
    @direction = Direction.cardinal_point(:anti_clockwise, direction)
  end

  def rotate_clockwise
    @direction = Direction.cardinal_point(:clockwise, direction)
  end

  def current_position
    puts "Robot is at #{position.current_position} facing #{direction}"
  end

  attr_accessor :position, :direction
end

class Direction
  CARDINAL_POINTS = %w[NORTH EAST SOUTH WEST].freeze

  def self.cardinal_point(orientation, current_direction)
    current_direction_index = CARDINAL_POINTS.index(current_direction)
    pointer = orientation == :anti_clockwise ? -1 : 1
    CARDINAL_POINTS.rotate(pointer)[current_direction_index]
  end
end
