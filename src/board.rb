# frozen_string_literal: true

class Board
  def initialize(height = 5, width = 5)
    @height = height
    @width = width
  end

  private

  attr_reader :height, :width
end
