# frozen_string_literal: true

# toy_robot_game
require './src/domain/position'
require './src/util/custom_exceptions'
require 'logger'
class ToyRobotGame
  def initialize(table:, robot:, processor_factory:, logger:)
    @table = table
    @robot = robot
    @processor_factory = processor_factory
    @logger = logger
  end

  def run(command)
    process_command(command)
  rescue StandardError => e
    logger.error(e.message)
  end

  private

  attr_reader :table, :robot, :logger

  def process_command(command)
    processor = @processor_factory.create_processor(command)
    validate_robot_placement(command)
    processor.call(command)
  end

  def parse_command(command)
    command.split(' ').first
  end

  def validate_robot_placement(command)
    command_name = parse_command(command)
    raise CustomExceptions::RobotNotPlacedError unless robot.placed? || robot_first_move?(command_name)
  end

  def robot_first_move?(command_name)
    command_name == 'PLACE'
  end
end
