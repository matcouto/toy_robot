# frozen_string_literal: true

class Board
  def initialize(height = 5, width = 5, robot = nil)
    @height = height
    @width = width
    @robot = robot
  end

  private

  attr_accessor :height, :width, :robot
end
