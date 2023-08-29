# frozen_string_literal: true

class Table
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def position_within_bounds?(position)
    position.x_axis.between?(0, width - 1) &&
      position.y_axis.between?(0, height - 1)
  end

  private

  attr_reader :height, :width
end
