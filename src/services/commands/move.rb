# frozen_string_literal: true

class Move < CommandProcessorBase
  def process(robot:)
    robot.move
  end
end
