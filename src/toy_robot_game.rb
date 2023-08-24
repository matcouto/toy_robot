# frozen_string_literal: true

require './src/position'
require './src/command_processor'
class ToyRobotGame
  def initialize(table:, robot:)
    @table = table
    @robot = robot
    @command_processor = CommandProcessor.new(@table, @robot)
  end

  def process(command)
    # TODO: Create custom exception for process | Special symbols in the command
    command_processor.call(command)
  end

  private

  attr_reader :table, :robot, :command_processor
end
