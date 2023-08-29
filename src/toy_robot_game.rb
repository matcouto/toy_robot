# frozen_string_literal: true

require './src/domain/position'
require './src/services/commands/processor'
require './src/util/custom_exceptions'
class ToyRobotGame
  def initialize(table:, robot:)
    @table = table
    @robot = robot
    @errors = []
  end

  attr_accessor :errors

  def process(command)
    Commands::Processor.new(table, robot).call(command)
  rescue StandardError => e
    errors << e
  end

  private

  attr_reader :table, :robot
end
