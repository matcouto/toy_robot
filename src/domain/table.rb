# frozen_string_literal: true

class Table
  def initialize(height = 5, width = 5)
    @height = height
    @width = width
  end

  def position_within_bounds?(position)
    (position.x_axis <= width - 1) &&
      (position.y_axis <= height - 1)
  end

  private

  attr_reader :height, :width
end
