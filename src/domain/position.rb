# frozen_string_literal: true

class Position
  def initialize(x_axis, y_axis)
    @x_axis = x_axis
    @y_axis = y_axis
  end

  attr_accessor :x_axis, :y_axis

  def current
    [x_axis, y_axis]
  end

  def valid?
    current.all? { |num| num.is_a? Integer } &&
      current.all? { |num| num >= 0 }
  end
end
