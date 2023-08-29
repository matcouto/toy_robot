# frozen_string_literal: true

require './src/domain/position'
require './src/util/custom_exceptions'
class ToyRobotGame
  def initialize(table:, robot:, processor_factory:)
    @table = table
    @robot = robot
    @processor_factory = processor_factory
    @errors = []
  end

  attr_accessor :errors

  def process(command)
    processor = @processor_factory.create_processor(command)
    check_placement(command)
    processor.call(command)
  rescue StandardError => e
    record_error(e)
  end

  def errors
    @errors.dup.freeze
  end

  private

  attr_reader :table, :robot

  def record_error(error)
    @errors << error
  end

  def parse_command(command)
    command.upcase.split(' ').first
  end

  def check_placement(command)
    command_name = parse_command(command)
    raise CustomExceptions::RobotNotPlacedError unless robot.placed? || robot_first_move?(command_name)
  end

  def robot_first_move?(command_name)
    command_name == 'PLACE'
  end
end
