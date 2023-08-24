# frozen_string_literal: true

require './src/domain/position'
require './src/services/commands/processor'
class ToyRobotGame
  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def process(command)
    # TODO: Create custom exception for process | Special symbols in the command
    Commands::Processor.new(
      table,
      robot
    ).call(command)
  end

  private

  attr_reader :table, :robot, :command_processor
end
