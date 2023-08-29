# frozen_string_literal: true

require './src/services/commands/move'
require './src/services/commands/place'
require './src/services/commands/report'
require './src/services/commands/rotate'
require './src/util/custom_exceptions'

module Commands
  class ProcessorFactory
    COMMANDS = {
      'PLACE' => Commands::Place,
      'MOVE' => Commands::Move,
      'LEFT' => Commands::Rotate,
      'RIGHT' => Commands::Rotate,
      'REPORT' => Commands::Report
    }.freeze

    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    def create_processor(command)
      command_name = parse_command(command)
      command_class = COMMANDS[command_name]

      raise CustomExceptions::CommandInvalidError, command_name unless command_class

      command_class.new(table, robot)
    end

    private

    attr_reader :table, :robot

    def robot_first_move?(command_name)
      command_name == 'PLACE'
    end

    def parse_command(command)
      command.upcase.split(' ').first
    end
  end
end
