# frozen_string_literal: true

class CommandBase
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def call(arguments = nil)
    raise NotImplementedError
  end
end
